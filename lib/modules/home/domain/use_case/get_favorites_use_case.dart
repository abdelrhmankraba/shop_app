import 'package:dartz/dartz.dart';
import 'package:shop_app/core/error/failure.dart';
import 'package:shop_app/core/use_case/base_use_case.dart';
import 'package:shop_app/modules/home/domain/entities/favorite_data.dart';
import 'package:shop_app/modules/home/domain/repository/base_shop_repository.dart';

class GetFavoritesUseCase extends BaseUseCase<Favorite,NoParameters>{
  final BaseShopRepository baseShopRepository;

  GetFavoritesUseCase(this.baseShopRepository);
  @override
  Future<Either<Failure, Favorite>> call(NoParameters parameters) async{
    return await baseShopRepository.getFavoritesData();
  }

}