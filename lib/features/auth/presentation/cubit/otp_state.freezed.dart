// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'otp_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OtpState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OtpState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OtpState()';
}


}

/// @nodoc
class $OtpStateCopyWith<$Res>  {
$OtpStateCopyWith(OtpState _, $Res Function(OtpState) __);
}


/// Adds pattern-matching-related methods to [OtpState].
extension OtpStatePatterns on OtpState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Success value)?  success,TResult Function( _Failure value)?  failure,TResult Function( _ResendLoading value)?  resendLoading,TResult Function( _ResendSuccess value)?  resendSuccess,TResult Function( _ResendFailure value)?  resendFailure,TResult Function( _TimerUpdate value)?  timerUpdate,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Success() when success != null:
return success(_that);case _Failure() when failure != null:
return failure(_that);case _ResendLoading() when resendLoading != null:
return resendLoading(_that);case _ResendSuccess() when resendSuccess != null:
return resendSuccess(_that);case _ResendFailure() when resendFailure != null:
return resendFailure(_that);case _TimerUpdate() when timerUpdate != null:
return timerUpdate(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Success value)  success,required TResult Function( _Failure value)  failure,required TResult Function( _ResendLoading value)  resendLoading,required TResult Function( _ResendSuccess value)  resendSuccess,required TResult Function( _ResendFailure value)  resendFailure,required TResult Function( _TimerUpdate value)  timerUpdate,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Success():
return success(_that);case _Failure():
return failure(_that);case _ResendLoading():
return resendLoading(_that);case _ResendSuccess():
return resendSuccess(_that);case _ResendFailure():
return resendFailure(_that);case _TimerUpdate():
return timerUpdate(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Success value)?  success,TResult? Function( _Failure value)?  failure,TResult? Function( _ResendLoading value)?  resendLoading,TResult? Function( _ResendSuccess value)?  resendSuccess,TResult? Function( _ResendFailure value)?  resendFailure,TResult? Function( _TimerUpdate value)?  timerUpdate,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Success() when success != null:
return success(_that);case _Failure() when failure != null:
return failure(_that);case _ResendLoading() when resendLoading != null:
return resendLoading(_that);case _ResendSuccess() when resendSuccess != null:
return resendSuccess(_that);case _ResendFailure() when resendFailure != null:
return resendFailure(_that);case _TimerUpdate() when timerUpdate != null:
return timerUpdate(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( OtpResponseModel otpResponse)?  success,TResult Function( String error)?  failure,TResult Function()?  resendLoading,TResult Function( OtpResponseModel otpResponse)?  resendSuccess,TResult Function( String error)?  resendFailure,TResult Function( int remainingSeconds)?  timerUpdate,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Success() when success != null:
return success(_that.otpResponse);case _Failure() when failure != null:
return failure(_that.error);case _ResendLoading() when resendLoading != null:
return resendLoading();case _ResendSuccess() when resendSuccess != null:
return resendSuccess(_that.otpResponse);case _ResendFailure() when resendFailure != null:
return resendFailure(_that.error);case _TimerUpdate() when timerUpdate != null:
return timerUpdate(_that.remainingSeconds);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( OtpResponseModel otpResponse)  success,required TResult Function( String error)  failure,required TResult Function()  resendLoading,required TResult Function( OtpResponseModel otpResponse)  resendSuccess,required TResult Function( String error)  resendFailure,required TResult Function( int remainingSeconds)  timerUpdate,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Success():
return success(_that.otpResponse);case _Failure():
return failure(_that.error);case _ResendLoading():
return resendLoading();case _ResendSuccess():
return resendSuccess(_that.otpResponse);case _ResendFailure():
return resendFailure(_that.error);case _TimerUpdate():
return timerUpdate(_that.remainingSeconds);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( OtpResponseModel otpResponse)?  success,TResult? Function( String error)?  failure,TResult? Function()?  resendLoading,TResult? Function( OtpResponseModel otpResponse)?  resendSuccess,TResult? Function( String error)?  resendFailure,TResult? Function( int remainingSeconds)?  timerUpdate,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Success() when success != null:
return success(_that.otpResponse);case _Failure() when failure != null:
return failure(_that.error);case _ResendLoading() when resendLoading != null:
return resendLoading();case _ResendSuccess() when resendSuccess != null:
return resendSuccess(_that.otpResponse);case _ResendFailure() when resendFailure != null:
return resendFailure(_that.error);case _TimerUpdate() when timerUpdate != null:
return timerUpdate(_that.remainingSeconds);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements OtpState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OtpState.initial()';
}


}




/// @nodoc


class _Loading implements OtpState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OtpState.loading()';
}


}




/// @nodoc


class _Success implements OtpState {
  const _Success(this.otpResponse);
  

 final  OtpResponseModel otpResponse;

/// Create a copy of OtpState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessCopyWith<_Success> get copyWith => __$SuccessCopyWithImpl<_Success>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success&&(identical(other.otpResponse, otpResponse) || other.otpResponse == otpResponse));
}


@override
int get hashCode => Object.hash(runtimeType,otpResponse);

@override
String toString() {
  return 'OtpState.success(otpResponse: $otpResponse)';
}


}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res> implements $OtpStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) _then) = __$SuccessCopyWithImpl;
@useResult
$Res call({
 OtpResponseModel otpResponse
});




}
/// @nodoc
class __$SuccessCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success _self;
  final $Res Function(_Success) _then;

/// Create a copy of OtpState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? otpResponse = null,}) {
  return _then(_Success(
null == otpResponse ? _self.otpResponse : otpResponse // ignore: cast_nullable_to_non_nullable
as OtpResponseModel,
  ));
}


}

/// @nodoc


class _Failure implements OtpState {
  const _Failure(this.error);
  

 final  String error;

/// Create a copy of OtpState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FailureCopyWith<_Failure> get copyWith => __$FailureCopyWithImpl<_Failure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Failure&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'OtpState.failure(error: $error)';
}


}

/// @nodoc
abstract mixin class _$FailureCopyWith<$Res> implements $OtpStateCopyWith<$Res> {
  factory _$FailureCopyWith(_Failure value, $Res Function(_Failure) _then) = __$FailureCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class __$FailureCopyWithImpl<$Res>
    implements _$FailureCopyWith<$Res> {
  __$FailureCopyWithImpl(this._self, this._then);

  final _Failure _self;
  final $Res Function(_Failure) _then;

/// Create a copy of OtpState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(_Failure(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ResendLoading implements OtpState {
  const _ResendLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResendLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OtpState.resendLoading()';
}


}




/// @nodoc


class _ResendSuccess implements OtpState {
  const _ResendSuccess(this.otpResponse);
  

 final  OtpResponseModel otpResponse;

/// Create a copy of OtpState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResendSuccessCopyWith<_ResendSuccess> get copyWith => __$ResendSuccessCopyWithImpl<_ResendSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResendSuccess&&(identical(other.otpResponse, otpResponse) || other.otpResponse == otpResponse));
}


@override
int get hashCode => Object.hash(runtimeType,otpResponse);

@override
String toString() {
  return 'OtpState.resendSuccess(otpResponse: $otpResponse)';
}


}

/// @nodoc
abstract mixin class _$ResendSuccessCopyWith<$Res> implements $OtpStateCopyWith<$Res> {
  factory _$ResendSuccessCopyWith(_ResendSuccess value, $Res Function(_ResendSuccess) _then) = __$ResendSuccessCopyWithImpl;
@useResult
$Res call({
 OtpResponseModel otpResponse
});




}
/// @nodoc
class __$ResendSuccessCopyWithImpl<$Res>
    implements _$ResendSuccessCopyWith<$Res> {
  __$ResendSuccessCopyWithImpl(this._self, this._then);

  final _ResendSuccess _self;
  final $Res Function(_ResendSuccess) _then;

/// Create a copy of OtpState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? otpResponse = null,}) {
  return _then(_ResendSuccess(
null == otpResponse ? _self.otpResponse : otpResponse // ignore: cast_nullable_to_non_nullable
as OtpResponseModel,
  ));
}


}

/// @nodoc


class _ResendFailure implements OtpState {
  const _ResendFailure(this.error);
  

 final  String error;

/// Create a copy of OtpState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResendFailureCopyWith<_ResendFailure> get copyWith => __$ResendFailureCopyWithImpl<_ResendFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResendFailure&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'OtpState.resendFailure(error: $error)';
}


}

/// @nodoc
abstract mixin class _$ResendFailureCopyWith<$Res> implements $OtpStateCopyWith<$Res> {
  factory _$ResendFailureCopyWith(_ResendFailure value, $Res Function(_ResendFailure) _then) = __$ResendFailureCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class __$ResendFailureCopyWithImpl<$Res>
    implements _$ResendFailureCopyWith<$Res> {
  __$ResendFailureCopyWithImpl(this._self, this._then);

  final _ResendFailure _self;
  final $Res Function(_ResendFailure) _then;

/// Create a copy of OtpState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(_ResendFailure(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _TimerUpdate implements OtpState {
  const _TimerUpdate(this.remainingSeconds);
  

 final  int remainingSeconds;

/// Create a copy of OtpState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TimerUpdateCopyWith<_TimerUpdate> get copyWith => __$TimerUpdateCopyWithImpl<_TimerUpdate>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TimerUpdate&&(identical(other.remainingSeconds, remainingSeconds) || other.remainingSeconds == remainingSeconds));
}


@override
int get hashCode => Object.hash(runtimeType,remainingSeconds);

@override
String toString() {
  return 'OtpState.timerUpdate(remainingSeconds: $remainingSeconds)';
}


}

/// @nodoc
abstract mixin class _$TimerUpdateCopyWith<$Res> implements $OtpStateCopyWith<$Res> {
  factory _$TimerUpdateCopyWith(_TimerUpdate value, $Res Function(_TimerUpdate) _then) = __$TimerUpdateCopyWithImpl;
@useResult
$Res call({
 int remainingSeconds
});




}
/// @nodoc
class __$TimerUpdateCopyWithImpl<$Res>
    implements _$TimerUpdateCopyWith<$Res> {
  __$TimerUpdateCopyWithImpl(this._self, this._then);

  final _TimerUpdate _self;
  final $Res Function(_TimerUpdate) _then;

/// Create a copy of OtpState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? remainingSeconds = null,}) {
  return _then(_TimerUpdate(
null == remainingSeconds ? _self.remainingSeconds : remainingSeconds // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
