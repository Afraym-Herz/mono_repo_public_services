import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core/src/shared_cubits/password_visibility/password_visibility_state.dart';

class PasswordVisibilityCubit extends Cubit<PasswordVisibilityState> {
  PasswordVisibilityCubit({bool initialObscured = true})
    : super(PasswordVisibilityState(isObscured: initialObscured));

  void toggleVisibility() {
    emit(state.copyWith(isObscured: !state.isObscured));
  }
}
