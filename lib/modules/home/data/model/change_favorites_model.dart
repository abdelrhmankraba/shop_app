
import 'package:shop_app/modules/home/domain/entities/change_favorites.dart';

class ChangeFavoritesModel extends ChangeFavorites {
  const ChangeFavoritesModel({required super.status, required super.message});

  factory ChangeFavoritesModel.fromJson(Map<String, dynamic> json) =>
      ChangeFavoritesModel(
        status: json['status'],
        message: json['message'],
      );
}
