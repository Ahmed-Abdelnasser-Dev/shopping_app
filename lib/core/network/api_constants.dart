class ApiConstants {
  // Base URL
  static const String baseUrl = 'https://accessories-eshop.runasp.net';
  // Timeouts for the requests
  static const Duration connectTimeout = Duration(seconds: 15);
  static const Duration receiveTimeout = Duration(seconds: 15);
  // Auth
  static const String signIn = '/api/auth/login';
  static const String signUp = '/api/auth/register';
  static const String logOut = '/api/auth/logout';
  static const String refreshToken = '/api/auth/refresh-token';

  // OTP
  static const String verifyEmail = '/api/auth/verify-email';
  static const String resendOtp = '/api/auth/resend-otp';

  // Home
  static const String categories = '/api/categories';
  static const String products = '/api/products';

  // Product
  static const String productById = '/api/products';
}

// Add to your existing ApiConstants class
class ApiErrorConstants {
  // Network Errors
  static const String noInternetError = "no_internet_error";
  static const String timeoutError = "timeout_error";
  static const String connectionError = "connection_error";

  // HTTP Status Codes
  static const String badRequestError = "bad_request_error";
  static const String unauthorizedError = "unauthorized_error";
  static const String forbiddenError = "forbidden_error";
  static const String notFoundError = "not_found_error";
  static const String conflictError = "conflict_error";
  static const String internalServerError = "internal_server_error";
  static const String serviceUnavailable = "service_unavailable";

  // Business Logic Errors
  static const String invalidCredentials = "invalid_credentials";
  static const String emailAlreadyExists = "email_already_exists";
  static const String accountLocked = "account_locked";
  static const String validationFailed = "validation_failed";

  // Client Side
  static const String cacheError = "cache_error";
  static const String unknownError = "unknown_error";
  static const String defaultError = "default_error";
}

class ApiUserMessages {
  // Network Errors
  static const String noInternet =
      'Please check your internet connection and try again.';
  static const String timeout = 'Request timed out. Please try again.';
  static const String connectionError =
      'Unable to connect to server. Please check your connection.';

  // Authentication Errors
  static const String invalidCredentials =
      'The email or password you entered is incorrect.';
  static const String unauthorized =
      'Your session has expired. Please log in again.';
  static const String forbidden =
      'You don\'t have permission to access this resource.';

  // Server Errors
  static const String internalServerError =
      'Something went wrong on our end. We\'re working on it!';
  static const String serviceUnavailable =
      'Service is temporarily unavailable. Please try again later.';

  // Client Errors
  static const String notFound = 'The requested resource was not found.';
  static const String badRequest =
      'There was an issue with your request. Please check your input.';

  // Business Logic
  static const String emailAlreadyExists =
      'An account with this email already exists.';
  static const String accountLocked =
      'Your account has been temporarily locked. Please try again later.';
  static const String validationFailed =
      'Please check your information and try again.';

  // Generic
  static const String unknownError = 'Something went wrong. Please try again.';
  static const String defaultError =
      'An unexpected error occurred. Please try again.';
}
