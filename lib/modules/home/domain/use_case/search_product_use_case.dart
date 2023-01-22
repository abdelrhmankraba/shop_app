import 'package:dartz/dartz.dart';
import 'package:shop_app/core/error/failure.dart';
import 'package:shop_app/core/use_case/base_use_case.dart';
import 'package:shop_app/modules/home/domain/entities/search.dart';
import 'package:shop_app/modules/home/domain/repository/base_shop_repository.dart';

class SearchProductUseCase extends BaseUseCase<Search, Parameters> {
  final BaseShopRepository baseShopRepository;

  SearchProductUseCase(this.baseShopRepository);

  @override
  Future<Either<Failure, Search>> call(Parameters parameters) async {
    return await baseShopRepository.searchProduct(parameters.text);
  }
}
