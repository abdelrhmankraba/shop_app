import 'package:dartz/dartz.dart';
import 'package:shop_app/core/error/failure.dart';
import 'package:shop_app/core/use_case/base_use_case.dart';
import 'package:shop_app/modules/login_and_register/domain/entities/login.dart';
import 'package:shop_app/modules/login_and_register/domain/repository/base_login_repository.dart';

class LoginUseCase extends BaseUseCase<ShopLogin ,Parameters>{
  final BaseLoginRepository baseShopRepository;

  LoginUseCase(this.baseShopRepository);
  @override
  Future<Either<Failure, ShopLogin>> call(Parameters parameters) async{
    return await baseShopRepository.checkLoginData(parameters.email, parameters.password);
  }

}