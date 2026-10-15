import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:doctor_clinics_app/features/auth/domain/entities/user.dart';
import 'package:doctor_clinics_app/features/auth/domain/repositories/auth_repository.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

/// App-owned auth flow. Bridges to shared [AppAuthCubit] so the router
/// redirect (`AppRouter.createRouter`) reacts to login/logout immediately.
class AuthCubit extends Cubit<AuthState> {
  final IAuthRepository repository;

  AuthCubit({required this.repository})
      : super(const AuthState.initial());

  /// Checks whether this is first run or existing session.
  Future<void> checkAuthStatus() async {
    emit(const AuthState.loading());
    final firstRunResult = await repository.isFirstRun();
    if (firstRunResult.fold((_) => false, (value) => value)) {
      emit(const AuthState.firstRun());
      return;
    }
    if (firstRunResult.isLeft()) {
      emit(
        AuthState.error(
          message: firstRunResult.fold(
            (failure) => failure.message,
            (_) => '',
          ),
        ),
      );
      return;
    }
    final userResult = await repository.currentAppUser();
    userResult.fold(
      (failure) => emit(AuthState.error(message: failure.message)),
      (user) {
        if (user == null) {
          emit(const AuthState.unauthenticated());
        } else {
          getIt<AppAuthCubit>().logIn(user.toAuthUser());
          emit(AuthState.authenticated(user: user));
        }
      },
    );
  }

  /// Logs in with [username] and [password].
  Future<void> login(String username, String password) async {
    emit(const AuthState.loading());
    final result = await repository.login(username, password);
    result.fold(
      (failure) => emit(AuthState.error(message: failure.message)),
      (user) {
        getIt<AppAuthCubit>().logIn(user.toAuthUser());
        emit(AuthState.authenticated(user: user));
      },
    );
  }

  /// Logs out the current user.
  Future<void> logout() async {
    try {
      await repository.logout();
    } finally {
      getIt<AppAuthCubit>().logOut();
      emit(const AuthState.unauthenticated());
    }
  }

  /// Creates the first user (first-run wizard).
  Future<void> createFirstUser({
    required String username,
    required String password,
  }) async {
    emit(const AuthState.loading());
    final result = await repository.createFirstUser(
      username: username,
      password: password,
    );
    result.fold(
      (failure) => emit(AuthState.error(message: failure.message)),
      (user) {
        getIt<AppAuthCubit>().logIn(user.toAuthUser());
        emit(AuthState.authenticated(user: user));
      },
    );
  }
}