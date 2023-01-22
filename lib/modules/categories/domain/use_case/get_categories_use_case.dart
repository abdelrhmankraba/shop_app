import 'package:dartz/dartz.dart';
import 'package:shop_app/core/error/failure.dart';
import 'package:shop_app/core/use_case/base_use_case.dart';
import 'package:shop_app/modules/categories/domain/entities/categories_data.dart';
import 'package:shop_app/modules/categories/domain/repository/base_categories_repository.dart';

class GetCategoryUseCase extends BaseUseCase<Categories , NoParameters>{
  final BaseCategoriesRepository baseCategoriesRepository;

  GetCategoryUseCase(this.baseCategoriesRepository);
  @override
  Future<Either<Failure, Categories>> call(NoParameters parameters) async{
    return await baseCategoriesRepository.getCategoriesData();
  }

}