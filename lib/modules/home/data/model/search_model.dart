
import 'package:shop_app/modules/home/domain/entities/search.dart';

class SearchModel extends Search {
  const SearchModel(
      {required super.status, required super.message, required super.data});

  factory SearchModel.fromJson(Map<String, dynamic> json) =>
      SearchModel(
        status: json['status'],
        message: json['message'],
        data:json['data'] != null ?DataModel.fromJson(json['data']): null,
      );
}

class DataModel extends Data {
  const DataModel({
    required super.currentPage,
    required super.data,
    required super.firstPageUrl,
    required super.from,
    required super.lastPage,
    required super.lastPageUrl,
    required super.nextPageUrl,
    required super.path,
    required super.perPage,
    required super.prevPageUrl,
    required super.to,
    required super.total,
  });

  factory DataModel.fromJson(Map<String, dynamic>json)=>
      DataModel(
        currentPage: json['current_page'],
        data:List<ProductModel>.from(json['data'].map((x) => ProductModel.fromJson(x))),
        firstPageUrl: json['first_page_url'],
        from: json['from'],
        lastPage: json['last_page'],
        lastPageUrl: json['last_page_url'],
        nextPageUrl: json['next_page_url'],
        path: json['path'],
        perPage: json['per_page'],
        prevPageUrl: json['prev_page_url'],
        to: json['to'],
        total: json['total'],
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
    required super.description,
  });

  factory ProductModel.fromJson(Map<String, dynamic>json)=>
      ProductModel(
        id: json['id'],
        price: json['price'],
        oldPrice: json['old_price'],
        discount: json['discount'],
        image: json['image'],
        name: json['name'],
        description: json['description'],
      );

}
