import 'package:dio/dio.dart';
import 'package:shopping_app/core/utils/token_manager.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // Skip adding token for auth endpoints
    if (_isAuthEndpoint(options.path)) {
      handler.next(options);
      return;
    }

    // Get access token
    final accessToken = await TokenManager.getAccessToken();
    
    if (accessToken != null) {
      // Add Authorization header
      options.headers['Authorization'] = 'Bearer $accessToken';
    }

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // Handle 401 Unauthorized responses
    if (err.response?.statusCode == 401) {
      final refreshToken = await TokenManager.getRefreshToken();
      
      if (refreshToken != null) {
        try {
          // Try to refresh the token
          final newTokens = await _refreshToken(refreshToken);
          
          if (newTokens != null) {
            // Update stored tokens
            await TokenManager.updateTokens(
              accessToken: newTokens['accessToken'],
              refreshToken: newTokens['refreshToken'],
              expiresAt: newTokens['expiresAt'],
            );

            // Retry the original request with new token
            final options = err.requestOptions;
            options.headers['Authorization'] = 'Bearer ${newTokens['accessToken']}';
            
            final response = await Dio().fetch(options);
            handler.resolve(response);
            return;
          }
        } catch (e) {
          // Refresh failed, clear tokens and redirect to login
          await TokenManager.clearTokens();
          // You might want to emit an event here to notify the app to redirect to login
        }
      } else {
        // No refresh token, clear all tokens
        await TokenManager.clearTokens();
      }
    }

    handler.next(err);
  }

  bool _isAuthEndpoint(String path) {
    final authEndpoints = [
      '/api/auth/login',
      '/api/auth/register',
      '/api/auth/verify-email',
      '/api/auth/resend-otp',
      '/api/auth/refresh-token',
    ];
    
    return authEndpoints.any((endpoint) => path.contains(endpoint));
  }

  Future<Map<String, dynamic>?> _refreshToken(String refreshToken) async {
    try {
      final dio = Dio();
      final response = await dio.post(
        'https://accessories-eshop.runasp.net/api/auth/refresh-token',
        data: {
          'refreshToken': refreshToken,
          'useCookies': false,
        },
      );

      if (response.statusCode == 200) {
        final data = response.data;
        return {
          'accessToken': data['accessToken'],
          'refreshToken': data['refreshToken'],
          'expiresAt': DateTime.parse(data['expiresAtUtc']),
        };
      }
    } catch (e) {
      // Handle refresh token failure
      print('Token refresh failed: $e');
    }
    
    return null;
  }
}
