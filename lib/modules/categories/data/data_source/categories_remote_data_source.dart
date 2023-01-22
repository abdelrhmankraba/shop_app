import 'package:shop_app/core/dio/dio_helper.dart';
import 'package:shop_app/core/error/exceptions.dart';
import 'package:shop_app/core/network/error_message_model.dart';
import 'package:shop_app/core/utils/constant.dart';
import 'package:shop_app/modules/categories/data/model/categories_model.dart';
import 'package:shop_app/modules/categories/data/model/category_products_model.dart';

abstract class BaseCategoriesRemoteDataSource {
  Future<CategoriesModel> getCategories();

  Future<CategoryProductsModel> getElectronicProducts();

  Future<CategoryProductsModel> getSportsProducts();

  Future<CategoryProductsModel> getPreventCoronaProducts();

  Future<CategoryProductsModel> getClothesProducts();

  Future<CategoryProductsModel> getLightingProducts();
}

class CategoriesRemoteDataSource extends BaseCategoriesRemoteDataSource {
  @override
  Future<CategoriesModel> getCategories() async {
    final response = await DioHelper.getData(
      url: 'categories',
      token: token,
    );
    if (response.statusCode == 200) {
      return CategoriesModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<CategoryProductsModel> getClothesProducts() async {
    final response = await DioHelper.getData(
      url: 'products?category_id=46',
      token: token,
    );

    if (response.statusCode == 200) {
      return CategoryProductsModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<CategoryProductsModel> getElectronicProducts() async {
    final response = await DioHelper.getData(
      url: 'products?category_id=44',
      token: token,
      // '916cydLBllyJPqJ8NXbshw51ScxUCDFqHluFf7tQj9RdNk22fmEIHFeZAflszGM7OgK7NZ',
    );

    if (response.statusCode == 200) {
      return CategoryProductsModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<CategoryProductsModel> getLightingProducts() async {
    final response = await DioHelper.getData(
      url: 'products?category_id=40',
      token: token,
    );

    if (response.statusCode == 200) {
      return CategoryProductsModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<CategoryProductsModel> getPreventCoronaProducts() async {
    final response = await DioHelper.getData(
      url: 'products?category_id=43',
      token: token,
    );

    if (response.statusCode == 200) {
      return CategoryProductsModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<CategoryProductsModel> getSportsProducts() async {
    final response = await DioHelper.getData(
      url: 'products?category_id=42',
      token: token,
    );

    if (response.statusCode == 200) {
      return CategoryProductsModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
