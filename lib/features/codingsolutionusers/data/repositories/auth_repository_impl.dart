import 'package:dartz/dartz.dart';

import 'package:codingsolutionusers/core/error/exceptions.dart';
import 'package:codingsolutionusers/core/error/failure.dart';
import 'package:codingsolutionusers/features/codingsolutionusers/data/datasources/remote/auth_remote_data_sources.dart';
import 'package:codingsolutionusers/features/codingsolutionusers/domain/entities/auth/login.dart';
import 'package:codingsolutionusers/features/codingsolutionusers/domain/entities/auth/register.dart';
import 'package:codingsolutionusers/features/codingsolutionusers/domain/entities/auth/user_info.dart';
import 'package:codingsolutionusers/features/codingsolutionusers/domain/entities/auth/users.dart';
import 'package:codingsolutionusers/features/codingsolutionusers/domain/repositories/auth_repository.dart';
import 'package:codingsolutionusers/features/codingsolutionusers/domain/usecases/auth/get_users.dart';
import 'package:codingsolutionusers/features/codingsolutionusers/domain/usecases/auth/post_login.dart';
import 'package:codingsolutionusers/features/codingsolutionusers/domain/usecases/auth/post_register.dart';
import 'package:codingsolutionusers/features/codingsolutionusers/domain/usecases/auth/post_user_info.dart';

class AuthRepositoryImpl implements AuthRepository {
  /// Data Source
  final AuthRemoteDatasource authRemoteDatasource;

  const AuthRepositoryImpl(this.authRemoteDatasource);

  @override
  Future<Either<Failure, Login>> login(LoginParams loginParams) async {
    try {
      final response = await authRemoteDatasource.login(loginParams);

      return Right(response.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, Register>> register(
    RegisterParams registerParams,
  ) async {
    try {
      final response = await authRemoteDatasource.register(registerParams);

      return Right(response.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }


  @override
  Future<Either<Failure, Users>> users(UsersParams usersParams) async {
    try {
      final response = await authRemoteDatasource.users(usersParams);

      /// Throw error when data is empty
      if (response.data?.isEmpty ?? true) {
        return Left(NoDataFailure());
      }

      return Right(response.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, UserInfo>> userInfo(
      UserInfoParams userInfoParams) async {
    try {
      final response = await authRemoteDatasource.userInfo(userInfoParams);

      return Right(response.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
