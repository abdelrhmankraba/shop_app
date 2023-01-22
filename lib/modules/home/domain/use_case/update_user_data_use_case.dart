import 'package:dartz/dartz.dart';
import 'package:shop_app/core/error/failure.dart';
import 'package:shop_app/core/use_case/base_use_case.dart';
import 'package:shop_app/modules/home/domain/repository/base_shop_repository.dart';
import 'package:shop_app/modules/login_and_register/domain/entities/login.dart';
class UpdateUserDataUseCase extends BaseUseCase<ShopLogin,Parameters>{
  final BaseShopRepository baseShopRepository;

  UpdateUserDataUseCase(this.baseShopRepository);
  @override
  Future<Either<Failure, ShopLogin>> call(Parameters parameters) async{
    return await baseShopRepository.updateUserData(parameters.name,parameters.email,parameters.phone);
  }

}
