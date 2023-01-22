import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/shared_preference/cache_helper.dart';
import 'package:shop_app/core/use_case/base_use_case.dart';
import 'package:shop_app/core/utils/constant.dart';
import 'package:shop_app/modules/categories/presentation/screens/categories_screen.dart';
import 'package:shop_app/modules/home/domain/entities/change_favorites.dart';
import 'package:shop_app/modules/home/domain/entities/favorite_data.dart';
import 'package:shop_app/modules/home/domain/entities/home_data.dart';
import 'package:shop_app/modules/home/domain/entities/search.dart';
import 'package:shop_app/modules/home/domain/use_case/change_favorites_use_case.dart';
import 'package:shop_app/modules/home/domain/use_case/get_favorites_use_case.dart';
import 'package:shop_app/modules/home/domain/use_case/get_home_data_use_case.dart';
import 'package:shop_app/modules/home/domain/use_case/get_user_data_use_case.dart';
import 'package:shop_app/modules/home/domain/use_case/search_product_use_case.dart';
import 'package:shop_app/modules/home/domain/use_case/update_user_data_use_case.dart';
import 'package:shop_app/modules/home/presentation/screens/favorites_screen.dart';
import 'package:shop_app/modules/home/presentation/screens/product_screen.dart';
import 'package:shop_app/modules/home/presentation/screens/settings_screen.dart';
import 'package:shop_app/modules/login_and_register/domain/entities/login.dart';

part 'shop_home_state.dart';

class ShopHomeCubit extends Cubit<ShopHomeState> {
  ShopHomeCubit(
    this.getHomeDataUseCase,
    this.changeFavoritesUseCase,
    this.getFavoritesUseCase,
    this.getUserDataUseCase,
    this.updateUserDataUseCase,
    this.searchProductUseCase,
  ) : super(ShopInitialState());

  static ShopHomeCubit get(context) => BlocProvider.of(context);
  final GetHomeDataUseCase getHomeDataUseCase;
  final ChangeFavoritesUseCase changeFavoritesUseCase;
  final GetFavoritesUseCase getFavoritesUseCase;
  final GetUserDataUseCase getUserDataUseCase;
  final UpdateUserDataUseCase updateUserDataUseCase;
  final SearchProductUseCase searchProductUseCase;
  List<Widget> bottomScreen = [
    const ProductsScreen(),
    const CategoryScreen(),
    const FavoritesScreen(),
    const SettingsScreen(),
  ];
  int currentIndex = 0;

  void changeBottom(int index, context) {
    currentIndex = index;
    if (index == 2) {
      getFavorites();
    }
    if (index == 3) {
      getUserData();
    }
    emit(ShopChangeBottomNavState());
  }

  HomeData? homeDataModel;
  Map<int, bool> favorites = {};

  void getHomeData() async {
    homeDataModel = null;
    token = CacheHelper.get(key: 'token');
    emit(ShopLoadingHomeDataState());
    final result = await getHomeDataUseCase(const NoParameters());
    emit(result.fold((failure) => ShopErrorHomeDataState(failure.message), (r) {
      homeDataModel = r;
      for (var element in homeDataModel!.data.products) {
        favorites.addAll({
          element.id: element.inFavorites,
        });
      }
      return ShopSuccessHomeDataState();
    }));

    // result.fold((l) {
    //   emit(ShopErrorHomeDataState());
    //   return l.message;
    // }, (r) {
    //   emit(ShopSuccessHomeDataState());
    //   homeDataModel=r;
    //   homeDataModel!.data.products.forEach((element) {
    //     favorites.addAll({
    //       element.id: element.inFavorites,
    //     });
    //   });
    //   return homeDataModel = r;
    //
    // });
  }

  late ChangeFavorites changeFavoritesModel;

  void changeFavorites(int productId) async {
    favorites[productId] = !favorites[productId]!;
    emit(ShopFavoritesState());
    final result = await changeFavoritesUseCase(Parameters(id: productId));
    emit(result.fold((failure) {
      return ShopErrorChangeFavoritesState(failure.message);
    }, (r) {
      changeFavoritesModel = r;
      if (!changeFavoritesModel.status) {
        favorites[productId] = !favorites[productId]!;
      } else {
        getFavorites();
      }
      return ShopSuccessChangeFavoritesState(r);
    }));

    // result.fold((l) {
    //   favorites[productId] = !favorites[productId]!;
    //   emit(ShopErrorChangeFavoritesState());
    //   return l.message;
    // }, (r) {
    //   changeFavoritesModel = r;
    //   numCategories = categoriesModel!.data.dataModel.length;
    //   if (!changeFavoritesModel.status) {
    //     favorites[productId] = !favorites[productId]!;
    //   } else {
    //     //getFavorites();
    //   }
    //   emit(ShopSuccessChangeFavoritesState(r));
    //   return changeFavoritesModel;
    // });
  }

  Favorite? favoriteModel;
  int numFavorites = 0;

  void getFavorites() async {
    emit(ShopLoadingGetFavoritesState());
    final result = await getFavoritesUseCase(const NoParameters());
    emit(result.fold((failure) {
      return ShopErrorGetFavoritesState(failure.message);
    }, (r) {
      favoriteModel = r;
      numFavorites = favoriteModel!.data!.data!.length;
      return ShopSuccessGetFavoritesState();
    }));
    // result.fold((l) {
    //   emit(ShopErrorGetFavoritesState());
    //   return l.message;
    // }, (r) {
    //   favoriteModel = r;
    //   numFavorites = favoriteModel!.data.data.length;
    //   emit(ShopSuccessGetFavoritesState());
    //   return categoriesModel;
    // });
  }

  ShopLogin? userModel;

  void getUserData() async {
    emit(ShopLoadingUserDataState());
    final result = await getUserDataUseCase(const NoParameters());
    emit(result.fold((failure) {
      return ShopErrorUserDataState(failure.message);
    }, (r) {
      userModel = r;
      return ShopSuccessUserDataState();
    }));
  }

  void updateUserData({
    required String name,
    required String email,
    required String phone,
  }) async {
    emit(ShopLoadingUpdateUserState());
    final result = await updateUserDataUseCase(
        Parameters(name: name, email: email, phone: phone));
    emit(result.fold((failure) {
      return ShopErrorUpdateUserState(failure.message);
    }, (r) {
      userModel = r;
      return ShopSuccessUpdateUserState();
    }));
  }

  Search? searchModel;

  void search({required String text}) async {
    emit(SearchLoadingState());
    final result = await searchProductUseCase(Parameters(text: text));
    emit(result.fold((failure) {
      return SearchErrorState(failure.message);
    }, (r) {
      searchModel = r;
      return SearchSuccessState();
    }));
  }
}
