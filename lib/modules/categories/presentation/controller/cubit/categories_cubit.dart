import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/shared_preference/cache_helper.dart';
import 'package:shop_app/core/use_case/base_use_case.dart';
import 'package:shop_app/core/utils/colors.dart';
import 'package:shop_app/core/utils/constant.dart';
import 'package:shop_app/modules/categories/domain/entities/categories_data.dart';
import 'package:shop_app/modules/categories/domain/entities/category_products.dart';
import 'package:shop_app/modules/categories/domain/use_case/get_categories_use_case.dart';
import 'package:shop_app/modules/categories/domain/use_case/get_clothes_products_use_case.dart';
import 'package:shop_app/modules/categories/domain/use_case/get_electronic_products_use_case.dart';
import 'package:shop_app/modules/categories/domain/use_case/get_lighting_products_use_case.dart';
import 'package:shop_app/modules/categories/domain/use_case/get_prevent_corona_products_use_case.dart';
import 'package:shop_app/modules/categories/domain/use_case/get_sports_products_use_case.dart';
import 'package:shop_app/modules/home/presentation/controller/shop_home_cubit.dart';

part 'categories_state.dart';

class ShopCategoriesCubit extends Cubit<ShopCategoriesState> {
  ShopCategoriesCubit(
    this.getCategoriesUseCase,
    this.getLightingProductsUseCase,
    this.getClothesProductsUseCase,
    this.getSportsProductsUseCase,
    this.getElectronicProductsUseCase,
    this.getPreventCoronaProductsUseCase,
  ) : super(ShopInitialState());

  static ShopCategoriesCubit get(context) => BlocProvider.of(context);
  final GetCategoryUseCase getCategoriesUseCase;
  final GetElectronicProductUseCase getElectronicProductsUseCase;
  final GetSportsProductUseCase getSportsProductsUseCase;
  final GetClotheProductUseCase getClothesProductsUseCase;
  final GetLightingProductUseCase getLightingProductsUseCase;
  final GetPreventCoronaProductUseCase getPreventCoronaProductsUseCase;

  Color colorFav = colorBottom;

  void changeFavorites(model, context) {
    emit(ShopChangeFavoritesState());
    ShopHomeCubit.get(context).changeFavorites(model.id!);
  }

  Categories? categoriesModel;
  int numCategories = 0;

  void getCategories() async {
    token = CacheHelper.get(key: 'token');
    final result = await getCategoriesUseCase(const NoParameters());
    emit(result.fold((failure) {
      return ShopErrorCategoriesState(failure.message);
    }, (r) {
      categoriesModel = r;
      numCategories = categoriesModel!.data.dataModel.length;
      return ShopSuccessCategoriesState();
    }));
    // result.fold((l) {
    //   emit(ShopErrorHomeDataState());
    //   return l.message;
    // }, (r) {
    //   categoriesModel = r;
    //   numCategories = categoriesModel!.data.dataModel.length;
    //   emit(ShopSuccessHomeDataState());
    //   return categoriesModel;
    // });
  }

  CategoryProducts? electronicDeviceModel;

  void getElectronicDevices() async {
    emit(ShopLoadingCategoryProductsState());
    final result = await getElectronicProductsUseCase(const NoParameters());
    emit(result.fold((failure) {
      return ShopErrorCategoryProductsState(failure.message);
    }, (r) {
      electronicDeviceModel = r;
      return ShopSuccessCategoryProductsState();
    }));
  }

  CategoryProducts? preventCorona;

  void getPreventCorona() async {
    emit(ShopLoadingCategoryProductsState());
    final result = await getPreventCoronaProductsUseCase(const NoParameters());
    emit(result.fold((failure) {
      return ShopErrorCategoryProductsState(failure.message);
    }, (r) {
      preventCorona = r;
      return ShopSuccessCategoryProductsState();
    }));
  }

  CategoryProducts? sports;

  void getSports() async {
    emit(ShopLoadingCategoryProductsState());
    final result = await getSportsProductsUseCase(const NoParameters());
    emit(result.fold((failure) {
      return ShopErrorCategoryProductsState(failure.message);
    }, (r) {
      sports = r;
      return ShopSuccessCategoryProductsState();
    }));
  }

  CategoryProducts? lighting;

  void getLighting() async {
    emit(ShopLoadingCategoryProductsState());
    final result = await getLightingProductsUseCase(const NoParameters());
    emit(result.fold((failure) {
      return ShopErrorCategoryProductsState(failure.message);
    }, (r) {
      lighting = r;
      return ShopSuccessCategoryProductsState();
    }));
  }

  CategoryProducts? clothes;

  void getClothes() async {
    emit(ShopLoadingCategoryProductsState());
    final result = await getClothesProductsUseCase(const NoParameters());
    emit(result.fold((failure) {
      return ShopErrorCategoryProductsState(failure.message);
    }, (r) {
      clothes = r;
      return ShopSuccessCategoryProductsState();
    }));
  }
}
