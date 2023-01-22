import 'package:dartz/dartz.dart';
import 'package:shop_app/core/error/exceptions.dart';
import 'package:shop_app/core/error/failure.dart';
import 'package:shop_app/modules/home/data/data_source/home_remote_data_source.dart';
import 'package:shop_app/modules/home/domain/entities/change_favorites.dart';
import 'package:shop_app/modules/home/domain/entities/favorite_data.dart';
import 'package:shop_app/modules/home/domain/entities/home_data.dart';
import 'package:shop_app/modules/home/domain/entities/search.dart';
import 'package:shop_app/modules/home/domain/repository/base_shop_repository.dart';
import 'package:shop_app/modules/login_and_register/domain/entities/login.dart';

class SHopRepository extends BaseShopRepository {
  final BaseHomeRemoteDataSource baseHomeRemoteDataSource;

  SHopRepository(this.baseHomeRemoteDataSource);

  @override
  Future<Either<Failure, HomeData>> getHomeData() async {
    final result = await baseHomeRemoteDataSource.getHomeData();
    try {
      //print(result);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage,
          failure.errorMessageModel.statusCode));
    }
  }

  @override
  Future<Either<Failure, ChangeFavorites>> changeFavorites(productId) async {
    final result = await baseHomeRemoteDataSource.changeFavorites(productId);
    try {
      //print(result);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage,
          failure.errorMessageModel.statusCode));
    }
  }

  @override
  Future<Either<Failure, Favorite>> getFavoritesData() async {
    final result = await baseHomeRemoteDataSource.getFavorites();
    try {
      //print(result);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage,
          failure.errorMessageModel.statusCode));
    }
  }

  @override
  Future<Either<Failure, ShopLogin>> getUserData() async {
    final result = await baseHomeRemoteDataSource.getUserData();
    try {
      //print(result);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage,
          failure.errorMessageModel.statusCode));
    }
  }

  @override
  Future<Either<Failure, ShopLogin>> updateUserData(name, email, phone) async {
    final result =
        await baseHomeRemoteDataSource.updateUserData(name, email, phone);
    try {
      //print(result);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage,
          failure.errorMessageModel.statusCode));
    }
  }

  @override
  Future<Either<Failure, Search>> searchProduct(text) async {
    final result = await baseHomeRemoteDataSource.searchProduct(text);
    try {
      //print(result);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage,
          failure.errorMessageModel.statusCode));
    }
  }
}
