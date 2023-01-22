part of 'categories_cubit.dart';

@immutable
abstract class ShopCategoriesState {}

class ShopInitialState extends ShopCategoriesState {}

class ShopLoadingCategoriesState extends ShopCategoriesState{}

class ShopSuccessCategoriesState extends ShopCategoriesState {}

class ShopErrorCategoriesState extends ShopCategoriesState {
  final String error;

  ShopErrorCategoriesState(this.error);
}

class ShopLoadingCategoryProductsState extends ShopCategoriesState{}

class ShopSuccessCategoryProductsState extends ShopCategoriesState{}

class ShopErrorCategoryProductsState extends ShopCategoriesState{
  final String  error;

  ShopErrorCategoryProductsState(this.error);
}

class ShopChangeFavoritesState extends ShopCategoriesState{}



