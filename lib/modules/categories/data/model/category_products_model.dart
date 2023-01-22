

import 'package:shop_app/modules/categories/domain/entities/category_products.dart';

class CategoryProductsModel extends CategoryProducts {
  const CategoryProductsModel(
      {required super.status, required super.message, required super.data});

  factory CategoryProductsModel.fromJson(Map<String, dynamic> json) =>
      CategoryProductsModel(
        status: json['status'],
        message: json['message'],
        data: DataModel.fromJson(json['data']),
      );
}

class DataModel extends Data {
  const DataModel({required super.data});

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        data: List<CatProductModel>.from(json['data'].map((x) => CatProductModel.fromJson(x))),
      );
}

class CatProductModel extends CatProduct {
  const CatProductModel({
    required super.id,
    required super.price,
    required super.oldPrice,
    required super.discount,
    required super.image,
    required super.name,
    required super.inFavorites,
    required super.inCart,
  });

  factory CatProductModel.fromJson(Map<String, dynamic> json) =>
      CatProductModel(
        id: json['id'],
        price: json['price'],
        oldPrice: json['old_price'],
        discount: json['discount'],
        image: json['image'],
        name: json['name'],
        inFavorites: json['in_favorites'],
        inCart: json['in_cart'],
      );
}
