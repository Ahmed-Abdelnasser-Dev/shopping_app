import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/network/api_result.dart';
import 'package:shopping_app/core/utils/token_manager.dart';
import 'package:shopping_app/core/utils/shared_preferences_helpers.dart';
import 'package:shopping_app/features/auth/data/repository/refresh_token_repository.dart';
import 'package:shopping_app/features/auth/data/repository/logout_repository.dart';
import 'package:shopping_app/features/auth/data/models/refresh_token_models/refresh_token_request_model.dart';
import 'package:shopping_app/features/auth/presentation/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final RefreshTokenRepository _refreshTokenRepository;
  final LogoutRepository _logoutRepository;

  AuthCubit(this._refreshTokenRepository, this._logoutRepository) : super(const AuthState.initial());

  // Check authentication status on app startup
  Future<void> checkAuthStatus() async {
    emit(const AuthState.loading());
    
    try {
      final isLoggedIn = await TokenManager.isLoggedIn();
      
      if (!isLoggedIn) {
        emit(const AuthState.unauthenticated());
        return;
      }

      // Check if token needs refresh
      final needsRefresh = await TokenManager.needsTokenRefresh();
      
      if (needsRefresh) {
        final refreshToken = await TokenManager.getRefreshToken();
        
        if (refreshToken != null) {
          final success = await _refreshTokens(refreshToken);
          if (success) {
            emit(const AuthState.authenticated());
          } else {
            await _clearAuthData();
            emit(const AuthState.unauthenticated());
          }
        } else {
          await _clearAuthData();
          emit(const AuthState.unauthenticated());
        }
      } else {
        emit(const AuthState.authenticated());
      }
    } catch (e) {
      await _clearAuthData();
      emit(AuthState.failure('Authentication check failed: $e'));
    }
  }

  // Refresh tokens
  Future<bool> _refreshTokens(String refreshToken) async {
    try {
      final request = RefreshTokenRequestModel(
        refreshToken: refreshToken,
        useCookies: false,
      );

      final response = await _refreshTokenRepository.refreshToken(request);

      return response.when(
        success: (refreshResponse) async {
          await TokenManager.updateTokens(
            accessToken: refreshResponse.accessToken,
            refreshToken: refreshResponse.refreshToken,
            expiresAt: refreshResponse.expiresAtUtc,
          );
          return true;
        },
        failure: (error) {
          print('Token refresh failed: $error');
          return false;
        },
      );
    } catch (e) {
      print('Token refresh error: $e');
      return false;
    }
  }

  // Login success - store tokens and user data
  Future<void> onLoginSuccess({
    required String accessToken,
    required String refreshToken,
    required DateTime expiresAt,
    required String email,
    required String firstName,
    required String lastName,
  }) async {
    try {
      // Store tokens
      await TokenManager.saveTokens(
        accessToken: accessToken,
        refreshToken: refreshToken,
        expiresAt: expiresAt,
      );

      // Store user profile
      await SharedPreferencesHelpers.saveUserProfile(
        email: email,
        firstName: firstName,
        lastName: lastName,
      );

      emit(const AuthState.authenticated());
    } catch (e) {
      emit(AuthState.failure('Failed to save login data: $e'));
    }
  }

  // Logout
  Future<void> logout() async {
    emit(const AuthState.loading());
    
    try {
      // Call logout API
      final response = await _logoutRepository.logout();
      
      response.when(
        success: (_) async {
          // Clear local data regardless of API response
          await _clearAuthData();
          emit(const AuthState.unauthenticated());
        },
        failure: (error) async {
          // Even if API call fails, clear local data
          await _clearAuthData();
          emit(const AuthState.unauthenticated());
        },
      );
    } catch (e) {
      // Even if there's an exception, clear local data
      await _clearAuthData();
      emit(const AuthState.unauthenticated());
    }
  }

  // Clear all authentication data
  Future<void> _clearAuthData() async {
    await TokenManager.clearTokens();
    await SharedPreferencesHelpers.clearAllUserData();
  }

  // Get current user profile
  Future<Map<String, String>?> getCurrentUserProfile() async {
    return await SharedPreferencesHelpers.getUserProfile();
  }

  // Check if user is currently authenticated
  Future<bool> isAuthenticated() async {
    final isLoggedIn = await TokenManager.isLoggedIn();
    if (!isLoggedIn) return false;
    
    final needsRefresh = await TokenManager.needsTokenRefresh();
    if (needsRefresh) {
      final refreshToken = await TokenManager.getRefreshToken();
      if (refreshToken != null) {
        return await _refreshTokens(refreshToken);
      }
      return false;
    }
    
    return true;
  }
}
