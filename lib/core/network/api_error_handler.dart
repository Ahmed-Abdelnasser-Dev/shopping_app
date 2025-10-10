import 'package:dio/dio.dart';
import 'package:shopping_app/core/network/api_constants.dart';
import 'package:shopping_app/core/network/api_error_model.dart';

class ApiErrorHandler {
  // Main method to get user-friendly error message from any error
  static String getErrorMessage(dynamic error) {
    if (error is DioException) {
      final errorCode = handleDioError(error);
      return getDisplayMessage(errorCode);
    } else if (error is String) {
      // If it's already a string, use it directly or map it
      return _mapStringErrorToMessage(error);
    } else {
      // For any other unknown error type
      return ApiUserMessages.defaultError;
    }
  }

  static String _mapStringErrorToMessage(String error) {
    // Map common string errors to user-friendly messages
    if (error.contains('SocketException') || error.contains('Network is unreachable')) {
      return ApiUserMessages.noInternet;
    } else if (error.contains('Timeout')) {
      return ApiUserMessages.timeout;
    } else {
      return error; // Return the original string if we can't map it
    }
  }

  // Existing Dio error handling (kept for internal use)
  static String handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return ApiErrorConstants.timeoutError;
      
      case DioExceptionType.badResponse:
        return _handleBadResponse(error.response);
      
      case DioExceptionType.badCertificate:
        return ApiErrorConstants.unauthorizedError;
      
      case DioExceptionType.cancel:
        return ApiErrorConstants.unknownError;
      
      case DioExceptionType.connectionError:
        return ApiErrorConstants.noInternetError;
      
      case DioExceptionType.unknown:
        return _handleUnknownError(error);
    }
  }

  static String _handleBadResponse(Response? response) {
    if (response == null) return ApiErrorConstants.unknownError;

    try {
      final errorData = response.data;
      
      // Handle structured validation errors from your API
      if (errorData is Map<String, dynamic> && 
          errorData.containsKey('errors') && 
          errorData['errors'] is Map<String, dynamic>) {
        
        return ApiErrorConstants.validationFailed;
      }
      
      // Try general error model
      final errorModel = ApiErrorModel.fromJson(errorData);
      return errorModel.code?.toString() ?? _mapStatusCodeToErrorCode(response.statusCode!);
    } catch (e) {
      return _mapStatusCodeToErrorCode(response.statusCode!);
    }
  }

  static String _mapStatusCodeToErrorCode(int statusCode) {
    switch (statusCode) {
      case 400:
        return ApiErrorConstants.badRequestError;
      case 401:
        return ApiErrorConstants.unauthorizedError;
      case 403:
        return ApiErrorConstants.forbiddenError;
      case 404:
        return ApiErrorConstants.notFoundError;
      case 409:
        return ApiErrorConstants.conflictError;
      case 500:
        return ApiErrorConstants.internalServerError;
      case 503:
        return ApiErrorConstants.serviceUnavailable;
      default:
        return ApiErrorConstants.unknownError;
    }
  }

  static String _handleUnknownError(DioException error) {
    if (error.error?.toString().contains('SocketException') == true) {
      return ApiErrorConstants.noInternetError;
    }
    return ApiErrorConstants.unknownError;
  }

  static String getDisplayMessage(String errorCode) {
    switch (errorCode) {
      case ApiErrorConstants.noInternetError:
        return ApiUserMessages.noInternet;
      case ApiErrorConstants.timeoutError:
        return ApiUserMessages.timeout;
      case ApiErrorConstants.unauthorizedError:
        return ApiUserMessages.unauthorized;
      case ApiErrorConstants.invalidCredentials:
        return ApiUserMessages.invalidCredentials;
      case ApiErrorConstants.emailAlreadyExists:
        return ApiUserMessages.emailAlreadyExists;
      case ApiErrorConstants.internalServerError:
        return ApiUserMessages.internalServerError;
      case ApiErrorConstants.serviceUnavailable:
        return ApiUserMessages.serviceUnavailable;
      case ApiErrorConstants.validationFailed:
        return ApiUserMessages.validationFailed;
      case ApiErrorConstants.accountLocked:
        return ApiUserMessages.accountLocked;
      case ApiErrorConstants.badRequestError:
        return ApiUserMessages.badRequest;
      case ApiErrorConstants.notFoundError:
        return ApiUserMessages.notFound;
      case ApiErrorConstants.forbiddenError:
        return ApiUserMessages.forbidden;
      default:
        return ApiUserMessages.defaultError;
    }
  }
}