import 'package:flutter/foundation.dart';
import 'package:shop_app/core/dio/dio_helper.dart';
import 'package:shop_app/core/error/exceptions.dart';
import 'package:shop_app/core/network/error_message_model.dart';
import 'package:shop_app/modules/login_and_register/data/model/login_model.dart';

abstract class BaseLoginRemoteDataSource {
  Future<ShopLoginModel> checkLoginData(email, password);

  Future<ShopLoginModel> registerUser(name, email, password, phone);
}

class LoginRemoteDataSource extends BaseLoginRemoteDataSource {
  @override
  Future<ShopLoginModel> checkLoginData(email, password) async {
    final response = await DioHelper.postData(url: 'login', data: {
      'email': email,
      'password': password,
    });
    if (kDebugMode) {
      print(response.data);
    }
    if (response.statusCode == 200) {
      return ShopLoginModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<ShopLoginModel> registerUser(name, email, password, phone) async {
    final response = await DioHelper.postData(url: 'register', data: {
      'name': name,
      'email': email,
      'password': password,
      'phone': phone,
    });
    if (kDebugMode) {
      print(response.data);
    }
    if (response.statusCode == 200) {
      return ShopLoginModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
