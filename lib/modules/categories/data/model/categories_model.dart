

import 'package:shop_app/modules/categories/domain/entities/categories_data.dart';

class CategoriesModel extends Categories {
  const CategoriesModel({required super.status, required super.data});

  factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
      CategoriesModel(
        status: json['status'],
        data: CategoriesDataModel.fromJson(json['data']),
      );
}

class CategoriesDataModel extends CategoriesData {
  const CategoriesDataModel(
      {required super.currentPage, required super.dataModel});

  factory CategoriesDataModel.fromJson(Map<String, dynamic>json)=>
      CategoriesDataModel(
        currentPage: json['current_page'],
        dataModel:List<DataCatModel>.from(json['data'].map((x) => DataCatModel.fromJson(x))),
      );
}

class DataCatModel extends DataCat {
  const DataCatModel({required super.id,required super.name,required super.image});

  factory DataCatModel.fromJson(Map<String, dynamic>json)=>
      DataCatModel(
        id:json['id'],
        name:json['name'],
        image:json['image'],
      );

}
