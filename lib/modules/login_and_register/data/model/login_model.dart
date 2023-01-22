
import 'package:shop_app/modules/login_and_register/domain/entities/login.dart';

class ShopLoginModel extends ShopLogin {
  const ShopLoginModel(
      {required super.status, required super.message, required super.data});

  factory ShopLoginModel.fromJson(Map<String, dynamic> json) => ShopLoginModel(
        status: json['status'],
        message: json['message']?? '',
        data: json['data'] !=null ? UserDateModel.fromJson(json['data']) : null,
      );
}

class UserDateModel extends UserDate {
  const UserDateModel({
    required super.id,
    required super.name,
    required super.email,
    required super.phone,
    required super.image,
    required super.token,
  });

  factory UserDateModel.fromJson(Map<String, dynamic> json) => UserDateModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        phone: json['phone'],
        image: json['image'],
        token: json['token'],
      );
}
