// ignore_for_file: prefer_void_to_null

import 'package:equatable/equatable.dart';

class Search extends Equatable {
  final bool status;
  final Null message;
  final Data? data;

  const Search(
      {required this.status, required this.message, required this.data});

  @override
  List<Object?> get props => [status, message, data];
}

class Data extends Equatable {
  final int? currentPage;
  final List<Product>? data;
  final String? firstPageUrl;
  final int? from;
  final int? lastPage;
  final String? lastPageUrl;
  final Null nextPageUrl;
  final String? path;
  final int? perPage;
  final Null prevPageUrl;
  final int? to;
  final int? total;

  const Data({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.nextPageUrl,
    required this.path,
    required this.perPage,
    required this.prevPageUrl,
    required this.to,
    required this.total,
  });

  @override
  List<Object?> get props => [
        currentPage,
        data,
        firstPageUrl,
        from,
        lastPage,
        lastPageUrl,
        nextPageUrl,
        path,
        perPage,
        prevPageUrl,
        to,
        total,
      ];
}

class Product extends Equatable {
  final int id;
  final dynamic price;
  final dynamic oldPrice;
  final int? discount;
  final String image;
  final String name;
  final String description;

  const Product({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
  });

  @override
  List<Object?> get props =>
      [id, price, oldPrice, discount, image, name, description];
}
