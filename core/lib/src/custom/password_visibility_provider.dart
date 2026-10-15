import 'package:core/src/shared_cubits/password_visibility/password_visibility_cubit.dart';
import 'package:core/src/shared_cubits/password_visibility/password_visibility_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_text_field_core.dart';
import 'app_text_field_params.dart';

/// Internal wiring giving `AppTextField` its own [PasswordVisibilityCubit].
class PasswordVisibilityProvider extends StatelessWidget {
  const PasswordVisibilityProvider({
    super.key,
    required this.params,
    required this.focusNode,
  });

  final TextFieldParams params;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PasswordVisibilityCubit>(
      create: (_) => PasswordVisibilityCubit(initialObscured: true),
      child: BlocBuilder<PasswordVisibilityCubit, PasswordVisibilityState>(
        builder: (context, state) => AppTextFieldCore(
          params: params,
          focusNode: focusNode,
          obscureText: state.isObscured,
          suffixIcon: IconButton(
            icon: Icon(
              state.isObscured ? Icons.visibility_off : Icons.visibility,
              color: Theme.of(context).hintColor,
            ),
            onPressed: () =>
                context.read<PasswordVisibilityCubit>().toggleVisibility(),
          ),
        ),
      ),
    );
  }
}
