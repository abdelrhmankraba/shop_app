
import 'package:shop_app/modules/home/domain/entities/home_data.dart';

class HomeDataModel extends HomeData {
  const HomeDataModel({required super.status, required super.data});

  factory HomeDataModel.fromJson(Map<String, dynamic> json) => HomeDataModel(
        status: json['status'],
        data: DataModel.fromJson(json['data']),
      );
}

class DataModel extends Data {
  const DataModel({required super.banners, required super.products});

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        banners: List<BannersModel>.from(
            json['banners'].map((x) => BannersModel.fromJson(x))),
        products: List<ProductModel>.from(
            json['products'].map((x) => ProductModel.fromJson(x))),
      );
}

class BannersModel extends Banner {
  const BannersModel({required super.id, required super.image});

  factory BannersModel.fromJson(Map<String, dynamic> json) => BannersModel(
        id: json['id'],
        image: json['image'],
      );
}

class ProductModel extends Product {
  const ProductModel({
    required super.id,
    required super.price,
    required super.oldPrice,
    required super.discount,
    required super.image,
    required super.name,
    required super.inFavorites,
    required super.inCard,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['id'],
        price: json['price'],
        oldPrice: json['old_price'],
        discount: json['discount'],
        image: json['image'],
        name: json['name'],
        inFavorites: json['in_favorites'],
        inCard: json['in_cart'],
      );
}
