import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core/src/auth/auth_user.dart';
import 'package:core/src/services/storage_service.dart';
import 'package:core/src/utils/app_constants.dart';
import 'package:core/src/utils/logger.dart';

import 'app_auth_state.dart';
export 'app_auth_state.dart';

class AppAuthCubit extends Cubit<AppAuthState> {
  final SecureStorageService secureStorage;

  AppAuthCubit({required this.secureStorage})
    : super(const AppAuthState.initial());

  Future<void> checkAuthStatus() async {
    try {
      final tokenRes = await secureStorage.readSecureData(AppConstants.TOKEN);
      tokenRes.fold((l) => emit(const AppAuthState.unauthenticated()), (
        token,
      ) async {
        if (token != null && token.isNotEmpty) {
          final userRes = await secureStorage.readSecureData(
            AppConstants.USER_INFO,
          );
          final userStr = userRes.fold((_) => null, (v) => v);
          if (userStr != null && userStr.isNotEmpty) {
            final userMap = jsonDecode(userStr);
            final user = AuthUser.fromMap(userMap);
            emit(AppAuthState.authenticated(user));
          } else {
            emit(const AppAuthState.unauthenticated());
          }
        } else {
          emit(const AppAuthState.unauthenticated());
        }
      });
    } catch (e) {
      AppLogger.error('Failed to check auth status: $e');
      emit(const AppAuthState.unauthenticated());
    }
  }

  /// Called after a successful login.
  void logIn(AuthUser user) {
    emit(AppAuthState.authenticated(user));
  }

  /// Called after logging out. The repository should clear the tokens.
  void logOut() {
    emit(const AppAuthState.unauthenticated());
  }
}
