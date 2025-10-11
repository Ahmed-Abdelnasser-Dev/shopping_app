import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/features/auth/data/models/otp_models/otp_request_model.dart';
import 'package:shopping_app/features/auth/data/models/otp_models/resend_otp_request_model.dart';
import 'package:shopping_app/features/auth/data/repository/otp_repository.dart';
import 'package:shopping_app/features/auth/presentation/cubit/otp_state.dart';
import 'package:shopping_app/core/network/api_result.dart';

class OtpCubit extends Cubit<OtpState> {
  final OtpRepository _otpRepository;
  final String email;

  final formKey = GlobalKey<FormState>();
  final List<TextEditingController> otpControllers = List.generate(
    6,
    (index) => TextEditingController(),
  );
  final List<FocusNode> otpFocusNodes = List.generate(
    6,
    (index) => FocusNode(),
  );

  Timer? _timer;
  int _remainingSeconds = 60;
  bool get canResend => _remainingSeconds == 0;

  OtpCubit(this._otpRepository, this.email) : super(const OtpState.initial()) {
    _startTimer();
  }

  void _startTimer() {
    _remainingSeconds = 60;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        _remainingSeconds--;
        // Emit a new state to trigger UI rebuild
        emit(OtpState.timerUpdate(_remainingSeconds));
      } else {
        timer.cancel();
        // Emit final state when timer reaches 0
        emit(OtpState.timerUpdate(0));
      }
    });
  }

  String get formattedTime {
    final minutes = _remainingSeconds ~/ 60;
    final seconds = _remainingSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  void emitVerifyEmailStates() async {
    emit(const OtpState.loading());
    final otpCode = otpControllers.map((controller) => controller.text).join();

    final otpRequest = OtpRequestModel(email: email, otp: otpCode);

    final response = await _otpRepository.verifyEmail(otpRequest);

    response.when(
      success: (otpResponse) {
        emit(OtpState.success(otpResponse));
      },
      failure: (error) {
        emit(OtpState.failure(error));
      },
    );
  }

  void emitResendOtpStates() async {
    emit(const OtpState.resendLoading());

    final resendOtpRequest = ResendOtpRequestModel(email: email);
    final response = await _otpRepository.resendOtp(resendOtpRequest);

    response.when(
      success: (otpResponse) {
        emit(OtpState.resendSuccess(otpResponse));
        _startTimer();
      },
      failure: (error) {
        emit(OtpState.resendFailure(error));
      },
    );
  }

  void updateTimer(int remainingSeconds) {
    _remainingSeconds = remainingSeconds;
  }

  bool validateForm() {
    final otpCode = otpControllers.map((controller) => controller.text).join();
    return otpCode.length == 6;
  }

  void onOtpChanged(int index, String value) {
    if (value.length == 1) {
      // Move to next field
      if (index < 5) {
        otpFocusNodes[index + 1].requestFocus();
      } else {
        // Last field, unfocus
        otpFocusNodes[index].unfocus();
      }
    } else if (value.isEmpty && index > 0) {
      // Move to previous field on backspace
      otpFocusNodes[index - 1].requestFocus();
    }
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    for (var controller in otpControllers) {
      controller.dispose();
    }
    for (var focusNode in otpFocusNodes) {
      focusNode.dispose();
    }
    return super.close();
  }
}
