import 'package:dartz/dartz.dart';
import 'package:shop_app/core/error/failure.dart';
import 'package:shop_app/core/use_case/base_use_case.dart';
import 'package:shop_app/modules/categories/domain/entities/category_products.dart';
import 'package:shop_app/modules/categories/domain/repository/base_categories_repository.dart';

class GetLightingProductUseCase extends BaseUseCase<CategoryProducts,NoParameters>{
  final BaseCategoriesRepository baseCategoriesRepository;

  GetLightingProductUseCase(this.baseCategoriesRepository);
  @override
  Future<Either<Failure, CategoryProducts>> call(NoParameters parameters) async{
    return await baseCategoriesRepository.getLightingProducts();
  }

}