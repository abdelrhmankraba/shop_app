import 'package:dartz/dartz.dart';
import 'package:shop_app/core/error/failure.dart';
import 'package:shop_app/core/use_case/base_use_case.dart';
import 'package:shop_app/modules/home/domain/entities/home_data.dart';
import 'package:shop_app/modules/home/domain/repository/base_shop_repository.dart';


class GetHomeDataUseCase extends BaseUseCase<HomeData , NoParameters>{
  final BaseShopRepository baseShopRepository;

  GetHomeDataUseCase(this.baseShopRepository);
  @override
  Future<Either<Failure, HomeData>> call(NoParameters parameters) async{
    return await baseShopRepository.getHomeData();
  }

}