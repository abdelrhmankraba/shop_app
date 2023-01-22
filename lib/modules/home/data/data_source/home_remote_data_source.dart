import 'package:shop_app/core/dio/dio_helper.dart';
import 'package:shop_app/core/error/exceptions.dart';
import 'package:shop_app/core/network/error_message_model.dart';
import 'package:shop_app/core/utils/constant.dart';
import 'package:shop_app/modules/home/data/model/change_favorites_model.dart';
import 'package:shop_app/modules/home/data/model/favorites_model.dart';
import 'package:shop_app/modules/home/data/model/home_data_model.dart';
import 'package:shop_app/modules/home/data/model/search_model.dart';
import 'package:shop_app/modules/login_and_register/data/model/login_model.dart';

abstract class BaseHomeRemoteDataSource {
  Future<HomeDataModel> getHomeData();

  Future<ChangeFavoritesModel> changeFavorites(productId);

  Future<FavoritesModel> getFavorites();

  Future<ShopLoginModel> getUserData();

  Future<ShopLoginModel> updateUserData(name, email, phone);

  Future<SearchModel> searchProduct(text);
}

class HomeRemoteDataSource extends BaseHomeRemoteDataSource {
  @override
  Future<HomeDataModel> getHomeData() async {
    final response = await DioHelper.getData(
      url: 'home',
      token: token,
    );
    if (response.statusCode == 200) {
      return HomeDataModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<ChangeFavoritesModel> changeFavorites(productId) async {
    final response = await DioHelper.postData(
      url: 'favorites',
      data: {'product_id': productId},
      token: token,
    );
    if (response.statusCode == 200) {
      return ChangeFavoritesModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<FavoritesModel> getFavorites() async {
    final response = await DioHelper.getData(
      url: 'favorites',
      token: token,
    );

    if (response.statusCode == 200) {
      return FavoritesModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<ShopLoginModel> getUserData() async {
    final response = await DioHelper.getData(
      url: 'profile',
      token: token,
    );

    if (response.statusCode == 200) {
      return ShopLoginModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<ShopLoginModel> updateUserData(name, email, phone) async {
    final response = await DioHelper.putData(
      url: 'update-profile',
      token: token,
      data: {
        'name': name,
        'email': email,
        'phone': phone,
      },
    );

    if (response.statusCode == 200) {
      return ShopLoginModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<SearchModel> searchProduct(text) async {
    final response = await DioHelper.postData(
      url: 'products/search',
      token: token,
      data: {
        'text': text,
      },
    );

    if (response.statusCode == 200) {
      return SearchModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
