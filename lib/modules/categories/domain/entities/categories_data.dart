import 'package:equatable/equatable.dart';

class Categories extends Equatable{
  final bool status;
  final CategoriesData data;

  const Categories({required this.status,required this.data});

  @override
  List<Object?> get props => [status , data];
}

class CategoriesData extends Equatable{
  final int currentPage;
  final List<DataCat> dataModel;

  const CategoriesData({required this.currentPage,required this.dataModel});

  @override
  List<Object?> get props => [currentPage,dataModel];
}

class DataCat extends Equatable{
  final int id;
  final String name;
  final String image;

  const DataCat({required this.id,required this.name,required this.image});

  @override
  List<Object?> get props => [id,name,image];
}