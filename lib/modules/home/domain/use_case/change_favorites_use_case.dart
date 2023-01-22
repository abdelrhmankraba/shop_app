import 'package:dartz/dartz.dart';
import 'package:shop_app/core/error/failure.dart';
import 'package:shop_app/core/use_case/base_use_case.dart';
import 'package:shop_app/modules/home/domain/entities/change_favorites.dart';
import 'package:shop_app/modules/home/domain/repository/base_shop_repository.dart';

class ChangeFavoritesUseCase extends BaseUseCase<ChangeFavorites, Parameters>{
  final BaseShopRepository baseShopRepository;

  ChangeFavoritesUseCase(this.baseShopRepository);
  @override
  Future<Either<Failure, ChangeFavorites>> call(Parameters parameters) async{
    return await baseShopRepository.changeFavorites(parameters.id);
  }

}