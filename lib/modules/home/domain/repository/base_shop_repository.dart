import 'package:dartz/dartz.dart';
import 'package:shop_app/core/error/failure.dart';
import 'package:shop_app/modules/home/domain/entities/change_favorites.dart';
import 'package:shop_app/modules/home/domain/entities/favorite_data.dart';
import 'package:shop_app/modules/home/domain/entities/home_data.dart';
import 'package:shop_app/modules/home/domain/entities/search.dart';
import 'package:shop_app/modules/login_and_register/domain/entities/login.dart';

abstract class BaseShopRepository {
  Future<Either<Failure, HomeData>> getHomeData();

  Future<Either<Failure, ChangeFavorites>> changeFavorites(productId);

  Future<Either<Failure, Favorite>> getFavoritesData();

  Future<Either<Failure, ShopLogin>> getUserData();

  Future<Either<Failure, ShopLogin>> updateUserData(name, email, phone);

  Future<Either<Failure, Search>> searchProduct(text);
}
