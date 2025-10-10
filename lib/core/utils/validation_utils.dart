class ValidationUtils {
  // Private constructor to prevent instantiation
  ValidationUtils._();

  // Email validation regex pattern
  static const String _emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
  
  // Password validation regex patterns
  static const String _uppercasePattern = r'[A-Z]';
  static const String _lowercasePattern = r'[a-z]';
  static const String _numberPattern = r'[0-9]';
  static const String _specialCharPattern = r'[!@#$%^&*(),.?":{}|<>]';
  
  // Compiled regex objects for better performance
  static final RegExp _emailRegex = RegExp(_emailPattern);
  static final RegExp _uppercaseRegex = RegExp(_uppercasePattern);
  static final RegExp _lowercaseRegex = RegExp(_lowercasePattern);
  static final RegExp _numberRegex = RegExp(_numberPattern);
  static final RegExp _specialCharRegex = RegExp(_specialCharPattern);

  /// Validates email format
  /// Returns null if valid, error message if invalid
  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Please enter your email';
    }
    
    if (!_emailRegex.hasMatch(email.trim())) {
      return 'Please enter a valid email address';
    }
    
    return null;
  }

  /// Validates password strength
  /// Returns null if valid, error message if invalid
  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Please enter your password';
    }
    
    if (password.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    
    return null;
  }

  /// Validates password strength with detailed requirements
  /// Returns PasswordValidationResult with detailed feedback
  static PasswordValidationResult validatePasswordStrength(String password) {
    return PasswordValidationResult(
      hasUppercase: _uppercaseRegex.hasMatch(password),
      hasLowercase: _lowercaseRegex.hasMatch(password),
      hasNumbers: _numberRegex.hasMatch(password),
      hasSpecialCharacters: _specialCharRegex.hasMatch(password),
      isLongEnough: password.length >= 8,
      isValid: _isPasswordValid(password),
    );
  }

  /// Checks if password meets all requirements
  static bool _isPasswordValid(String password) {
    return password.length >= 8 &&
           _uppercaseRegex.hasMatch(password) &&
           _lowercaseRegex.hasMatch(password) &&
           _numberRegex.hasMatch(password) &&
           _specialCharRegex.hasMatch(password);
  }

  /// Validates name (for signup forms)
  static String? validateName(String? name) {
    if (name == null || name.isEmpty) {
      return 'Please enter your name';
    }
    
    if (name.trim().length < 2) {
      return 'Name must be at least 2 characters long';
    }
    
    return null;
  }

  /// Validates phone number
  static String? validatePhoneNumber(String? phone) {
    if (phone == null || phone.isEmpty) {
      return 'Please enter your phone number';
    }
    
    // Remove all non-digit characters for validation
    final digitsOnly = phone.replaceAll(RegExp(r'[^\d]'), '');
    
    if (digitsOnly.length < 10) {
      return 'Please enter a valid phone number';
    }
    
    return null;
  }

  /// Validates confirm password
  static String? validateConfirmPassword(String? password, String? confirmPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'Please confirm your password';
    }
    
    if (password != confirmPassword) {
      return 'Passwords do not match';
    }
    
    return null;
  }
}

/// Data class for password validation results
class PasswordValidationResult {
  final bool hasUppercase;
  final bool hasLowercase;
  final bool hasNumbers;
  final bool hasSpecialCharacters;
  final bool isLongEnough;
  final bool isValid;

  const PasswordValidationResult({
    required this.hasUppercase,
    required this.hasLowercase,
    required this.hasNumbers,
    required this.hasSpecialCharacters,
    required this.isLongEnough,
    required this.isValid,
  });

  /// Returns the number of requirements met
  int get requirementsMet {
    int count = 0;
    if (hasUppercase) count++;
    if (hasLowercase) count++;
    if (hasNumbers) count++;
    if (hasSpecialCharacters) count++;
    if (isLongEnough) count++;
    return count;
  }

  /// Returns the total number of requirements
  int get totalRequirements => 5;

  /// Returns the percentage of requirements met
  double get completionPercentage => requirementsMet / totalRequirements;
}
