import 'package:doctor_clinics_app/features/auth/data/datasources/auth_datasource.dart';
import 'package:doctor_clinics_app/features/auth/data/repositories/auth_login_ops.dart';
import 'package:doctor_clinics_app/features/auth/data/repositories/auth_user_ops.dart';
import 'package:doctor_clinics_app/features/auth/domain/repositories/auth_repository.dart';

/// Concrete [IAuthRepository] backed by a local datasource.
///
/// Also implements core [AuthRepository] by mapping [User] ↔ [AuthUser] at
/// the boundary, so `getIt<AuthRepository>()` never throws at runtime.
class AuthRepositoryImpl
    with AuthLoginOps, AuthUserOps
    implements IAuthRepository {
  @override
  final IAuthDatasource datasource;

  AuthRepositoryImpl({required this.datasource});
}
