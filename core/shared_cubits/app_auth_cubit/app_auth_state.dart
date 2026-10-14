import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:agreements/features/auth/domain/entities/auth_user.dart';

part 'app_auth_state.freezed.dart';

@freezed
abstract class AppAuthState with _$AppAuthState {
  const factory AppAuthState.initial() = _Initial;
  const factory AppAuthState.unauthenticated() = _Unauthenticated;
  const factory AppAuthState.authenticated(AuthUser user) = _Authenticated;
}
