import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:shop_app/core/error/exceptions.dart';
import 'package:shop_app/core/error/failure.dart';
import 'package:shop_app/modules/login_and_register/data/data_source/login_remote_data_source.dart';
import 'package:shop_app/modules/login_and_register/domain/entities/login.dart';
import 'package:shop_app/modules/login_and_register/domain/repository/base_login_repository.dart';

class LoginRepository extends BaseLoginRepository {
  final BaseLoginRemoteDataSource baseShopRemoteDataSource;

  LoginRepository(this.baseShopRemoteDataSource);

  @override
  Future<Either<Failure, ShopLogin>> checkLoginData(email, password) async {
    final result =
        await baseShopRemoteDataSource.checkLoginData(email, password);
    try {
      if (kDebugMode) {
        print(result.message);
      }
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage,
          failure.errorMessageModel.statusCode));
    }
  }

  @override
  Future<Either<Failure, ShopLogin>> registerUser(
      name, email, password, phone) async {
    final result = await baseShopRemoteDataSource.registerUser(
        name, email, password, phone);
    try {
      if (kDebugMode) {
        print(result.message);
      }
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage,
          failure.errorMessageModel.statusCode));
    }
  }
}
