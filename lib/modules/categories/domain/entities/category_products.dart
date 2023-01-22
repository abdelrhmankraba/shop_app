// ignore_for_file: prefer_void_to_null

import 'package:equatable/equatable.dart';

class CategoryProducts extends Equatable {
  final bool status;
  final Null message;
  final Data data;

  const CategoryProducts({
    required this.status,
    required this.message,
    required this.data,
  });

  @override
  List<Object?> get props => [status, message, data];
}

class Data extends Equatable {
  final List<CatProduct> data;

  const Data({required this.data});

  @override
  List<Object?> get props => [data];
}

class CatProduct extends Equatable {
  final int id;
  final dynamic price;
  final dynamic oldPrice;
  final int discount;
  final String image;
  final String name;
  final bool inFavorites;
  final bool inCart;

  const CatProduct({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.inFavorites,
    required this.inCart,
  });

  @override
  List<Object?> get props =>
      [id, price, oldPrice, discount, image, name, inFavorites, inCart];
}
