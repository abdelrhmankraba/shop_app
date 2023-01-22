import 'package:dartz/dartz.dart';
import 'package:shop_app/core/error/failure.dart';
import 'package:shop_app/core/use_case/base_use_case.dart';
import 'package:shop_app/modules/home/domain/repository/base_shop_repository.dart';
import 'package:shop_app/modules/login_and_register/domain/entities/login.dart';
class GetUserDataUseCase extends BaseUseCase<ShopLogin,NoParameters>{
  final BaseShopRepository baseShopRepository;

  GetUserDataUseCase(this.baseShopRepository);
  @override
  Future<Either<Failure, ShopLogin>> call(NoParameters parameters) async{
    return await baseShopRepository.getUserData();
  }

}
