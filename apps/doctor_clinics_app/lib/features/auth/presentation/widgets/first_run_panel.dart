import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:doctor_clinics_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:doctor_clinics_app/features/auth/presentation/widgets/first_run_form.dart';

/// First-run setup form: creates the initial admin account.
///
/// Shown instead of the login form when [AuthState.firstRun] is emitted
/// (e.g. a fresh web profile whose local DB has no users yet). On success
/// [AuthCubit] emits `authenticated`, and the router redirects to `/home`.
class FirstRunPanel extends StatefulWidget {
  const FirstRunPanel({super.key});

  @override
  State<FirstRunPanel> createState() => _FirstRunPanelState();
}

class _FirstRunPanelState extends State<FirstRunPanel> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _usernameController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmController;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmController = TextEditingController();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    FocusScope.of(context).unfocus();
    TextInput.finishAutofillContext();
    context.read<AuthCubit>().createFirstUser(
      username: _usernameController.text.trim(),
      password: _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FirstRunForm(
      formKey: _formKey,
      usernameController: _usernameController,
      passwordController: _passwordController,
      confirmController: _confirmController,
      onSubmit: _submit,
    );
  }
}
