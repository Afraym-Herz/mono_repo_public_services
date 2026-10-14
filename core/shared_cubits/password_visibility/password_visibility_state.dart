import 'package:freezed_annotation/freezed_annotation.dart';

part 'password_visibility_state.freezed.dart';

@freezed
abstract class PasswordVisibilityState with _$PasswordVisibilityState {
  const factory PasswordVisibilityState({@Default(true) bool isObscured}) =
      _PasswordVisibilityState;
}
