part of 'shop_home_cubit.dart';

@immutable
abstract class ShopHomeState {}

class ShopInitialState extends ShopHomeState {}

class ShopChangeBottomNavState extends ShopHomeState {}

class ShopLoadingHomeDataState extends ShopHomeState {}

class ShopSuccessHomeDataState extends ShopHomeState {}

class ShopErrorHomeDataState extends ShopHomeState {
  final String  error;

  ShopErrorHomeDataState(this.error);
}

class ShopSuccessCategoriesState extends ShopHomeState {}

class ShopErrorCategoriesState extends ShopHomeState {}

class ShopFavoritesState extends ShopHomeState {}

class ShopSuccessChangeFavoritesState extends ShopHomeState {
  final ChangeFavorites changeFavoritesModel;

  ShopSuccessChangeFavoritesState(this.changeFavoritesModel);
}

class ShopErrorChangeFavoritesState extends ShopHomeState {
  final String  error;

  ShopErrorChangeFavoritesState(this.error);
}

class ShopLoadingGetFavoritesState extends ShopHomeState {}

class ShopSuccessGetFavoritesState extends ShopHomeState {}

class ShopErrorGetFavoritesState extends ShopHomeState {
  final String  error;

  ShopErrorGetFavoritesState(this.error);
}

class ShopLoadingCategoryProductsState extends ShopHomeState{}

class ShopSuccessCategoryProductsState extends ShopHomeState{}

class ShopErrorCategoryProductsState extends ShopHomeState{
  final String  error;

  ShopErrorCategoryProductsState(this.error);
}
class ShopLoadingUserDataState extends ShopHomeState{}

class ShopSuccessUserDataState extends ShopHomeState{}

class ShopErrorUserDataState extends ShopHomeState{
  final String  error;

  ShopErrorUserDataState(this.error);
}

class ShopLoadingUpdateUserState extends ShopHomeState{}

class ShopSuccessUpdateUserState extends ShopHomeState{}

class ShopErrorUpdateUserState extends ShopHomeState{
  final String  error;

  ShopErrorUpdateUserState(this.error);

}

class SearchLoadingState extends ShopHomeState{}

class SearchSuccessState extends ShopHomeState{}

class SearchErrorState extends ShopHomeState{
  final String  error;

  SearchErrorState(this.error);
}