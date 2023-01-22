import 'package:flutter/material.dart';
import 'package:shop_app/core/shared_preference/cache_helper.dart';
import 'package:shop_app/modules/login_and_register/presentation/screens/login_screen.dart';

String? token = '';

void signOut(context) {
  CacheHelper.removeData(key: 'token').then((value) {
    if (value) {
      token =CacheHelper.get(key: 'token');
      Navigator.push(context, MaterialPageRoute(
          builder: (BuildContext context) => const ShopLoginScreen()));
    }
  });
}