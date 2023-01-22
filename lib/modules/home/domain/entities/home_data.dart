import 'package:equatable/equatable.dart';

class HomeData extends Equatable {
  final bool status;
  final Data data;

  const HomeData({required this.status, required this.data});

  @override
  List<Object?> get props => [status, data];
}

class Data extends Equatable {
  final List<Banner> banners;
  final List<Product> products;

  const Data({required this.banners, required this.products});

  @override
  List<Object?> get props => [banners, products];
}

class Banner extends Equatable {
  final int id;
  final String image;

  const Banner({required this.id, required this.image});

  @override
  List<Object?> get props => [id, image];
}

class Product extends Equatable {
  final int id;
  final dynamic price;
  final dynamic oldPrice;
  final dynamic discount;
  final String image;
  final String name;
  final bool inFavorites;
  final bool? inCard;

  const Product({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.inFavorites,
    required this.inCard,
  });

  @override
  List<Object?> get props =>
      [id, price, oldPrice, discount, image, name, inFavorites, inCard];
}
