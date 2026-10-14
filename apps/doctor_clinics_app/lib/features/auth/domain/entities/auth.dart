import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth.freezed.dart';
part 'auth.g.dart';

@freezed
class AuthCredentials with _$AuthCredentials {
  const factory AuthCredentials({
    required String username,
    required String password,
  }) = _AuthCredentials;

  factory AuthCredentials.fromJson(Map<String, dynamic> json) => _$AuthCredentialsFromJson(json);
}
