import 'package:dartz/dartz.dart';
import 'package:shop_app/core/error/failure.dart';
import 'package:shop_app/modules/categories/domain/entities/categories_data.dart';
import 'package:shop_app/modules/categories/domain/entities/category_products.dart';


abstract class BaseCategoriesRepository {

  Future<Either<Failure, Categories>> getCategoriesData();

  Future<Either<Failure, CategoryProducts>> getElectronicProducts();

  Future<Either<Failure, CategoryProducts>> getPreventCoronaProducts();

  Future<Either<Failure, CategoryProducts>> getSportsProducts();

  Future<Either<Failure, CategoryProducts>> getLightingProducts();

  Future<Either<Failure, CategoryProducts>> getClothesProducts();
}
