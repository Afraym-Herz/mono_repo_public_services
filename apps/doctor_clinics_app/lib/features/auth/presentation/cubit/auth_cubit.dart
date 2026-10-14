import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:doctor_clinics_app/features/auth/domain/entities/user.dart';
import 'package:doctor_clinics_app/features/auth/domain/repositories/auth_repository.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

/// Manages authentication state for the clinic app.
class AuthCubit extends Cubit<AuthState> {
  final IAuthRepository repository;

  AuthCubit({required this.repository})
      : super(const AuthState.initial());

  /// Checks whether this is first run or existing session.
  Future<void> checkAuthStatus() async {
    // TODO: implement.
  }

  /// Logs in with [username] and [password].
  Future<void> login(String username, String password) async {
    // TODO: implement.
  }

  /// Logs out the current user.
  Future<void> logout() async {
    // TODO: implement.
  }

  /// Creates the first user (first-run wizard).
  Future<void> createFirstUser({
    required String username,
    required String password,
  }) async {
    // TODO: implement.
  }
}