import 'package:flutter_bloc/flutter_bloc.dart';

/// Scoped UI state for the login "remember me" checkbox.
///
/// Kept separate from [AuthCubit] (CLAUDE.md: one focused Cubit per flow) —
/// persistence of this preference is a `TODO(auth)` for a later change.
class RememberMeCubit extends Cubit<bool> {
  RememberMeCubit() : super(true);

  void toggle() => emit(!state);
}
