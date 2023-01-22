import 'package:dartz/dartz.dart';
import 'package:shop_app/core/error/exceptions.dart';
import 'package:shop_app/core/error/failure.dart';
import 'package:shop_app/modules/categories/data/data_source/categories_remote_data_source.dart';
import 'package:shop_app/modules/categories/domain/entities/categories_data.dart';
import 'package:shop_app/modules/categories/domain/entities/category_products.dart';
import 'package:shop_app/modules/categories/domain/repository/base_categories_repository.dart';

class SHopCategoriesRepository extends BaseCategoriesRepository{
  final BaseCategoriesRemoteDataSource baseCategoriesRemoteDataSource;

  SHopCategoriesRepository(this.baseCategoriesRemoteDataSource);


  @override
  Future<Either<Failure, Categories>> getCategoriesData() async{
    final result = await baseCategoriesRemoteDataSource.getCategories();
    try {
      //print(result);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage,failure.errorMessageModel.statusCode));
    }
  }

  @override
  Future<Either<Failure, CategoryProducts>> getClothesProducts() async{
    final result = await baseCategoriesRemoteDataSource.getClothesProducts();
    try {
      //print(result);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage,failure.errorMessageModel.statusCode));
    }
  }

  @override
  Future<Either<Failure, CategoryProducts>> getElectronicProducts() async{
    final result = await baseCategoriesRemoteDataSource.getElectronicProducts();
    try {
      //print(result);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage,failure.errorMessageModel.statusCode));
    }
  }

  @override
  Future<Either<Failure, CategoryProducts>> getLightingProducts() async{
    final result = await baseCategoriesRemoteDataSource.getLightingProducts();
    try {
      //print(result);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage,failure.errorMessageModel.statusCode));
    }
  }

  @override
  Future<Either<Failure, CategoryProducts>> getPreventCoronaProducts() async{
    final result = await baseCategoriesRemoteDataSource.getPreventCoronaProducts();
    try {
      //print(result);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage,failure.errorMessageModel.statusCode));
    }
  }

  @override
  Future<Either<Failure, CategoryProducts>> getSportsProducts() async{
    final result = await baseCategoriesRemoteDataSource.getSportsProducts();
    try {
      //print(result);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage,failure.errorMessageModel.statusCode));
    }
  }


}