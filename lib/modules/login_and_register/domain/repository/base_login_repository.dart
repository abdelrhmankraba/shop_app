import 'package:dartz/dartz.dart';
import 'package:shop_app/core/error/failure.dart';
import 'package:shop_app/modules/login_and_register/domain/entities/login.dart';

abstract class BaseLoginRepository{
  Future<Either<Failure , ShopLogin>> checkLoginData(email , password);
  Future<Either<Failure , ShopLogin>> registerUser(name,email , password,phone);
}