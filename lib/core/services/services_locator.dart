import 'package:get_it/get_it.dart';
import 'package:shop_app/modules/categories/data/data_source/categories_remote_data_source.dart';
import 'package:shop_app/modules/categories/data/repository/catrgories_repository.dart';
import 'package:shop_app/modules/categories/domain/repository/base_categories_repository.dart';
import 'package:shop_app/modules/categories/domain/use_case/get_categories_use_case.dart';
import 'package:shop_app/modules/categories/domain/use_case/get_clothes_products_use_case.dart';
import 'package:shop_app/modules/categories/domain/use_case/get_electronic_products_use_case.dart';
import 'package:shop_app/modules/categories/domain/use_case/get_lighting_products_use_case.dart';
import 'package:shop_app/modules/categories/domain/use_case/get_prevent_corona_products_use_case.dart';
import 'package:shop_app/modules/categories/domain/use_case/get_sports_products_use_case.dart';
import 'package:shop_app/modules/categories/presentation/controller/cubit/categories_cubit.dart';
import 'package:shop_app/modules/home/data/data_source/home_remote_data_source.dart';
import 'package:shop_app/modules/home/data/repository/shop_repository.dart';
import 'package:shop_app/modules/home/domain/repository/base_shop_repository.dart';
import 'package:shop_app/modules/home/domain/use_case/change_favorites_use_case.dart';
import 'package:shop_app/modules/home/domain/use_case/get_favorites_use_case.dart';
import 'package:shop_app/modules/home/domain/use_case/get_home_data_use_case.dart';
import 'package:shop_app/modules/home/domain/use_case/get_user_data_use_case.dart';
import 'package:shop_app/modules/home/domain/use_case/search_product_use_case.dart';
import 'package:shop_app/modules/home/domain/use_case/update_user_data_use_case.dart';
import 'package:shop_app/modules/home/presentation/controller/shop_home_cubit.dart';
import 'package:shop_app/modules/login_and_register/data/data_source/login_remote_data_source.dart';
import 'package:shop_app/modules/login_and_register/data/repository/login_repository.dart';
import 'package:shop_app/modules/login_and_register/domain/repository/base_login_repository.dart';
import 'package:shop_app/modules/login_and_register/domain/use_cases/login_use_case.dart';
import 'package:shop_app/modules/login_and_register/domain/use_cases/register_user_use_case.dart';
import 'package:shop_app/modules/login_and_register/presentation/controller/cubit/shop_login_cubit.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    ///bloc
    sl.registerFactory(() => ShopCategoriesCubit(sl(), sl(), sl(), sl(), sl(), sl()));
    sl.registerFactory(() => ShopLoginCubit(sl(), sl()));
    sl.registerFactory(() => ShopHomeCubit(sl(), sl(), sl(), sl(), sl(), sl()));

    ///use cases
    sl.registerLazySingleton(() => LoginUseCase(sl()));
    sl.registerLazySingleton(() => RegisterUserUseCase(sl()));
    sl.registerLazySingleton(() => GetHomeDataUseCase(sl()));
    sl.registerLazySingleton(() => ChangeFavoritesUseCase(sl()));
    sl.registerLazySingleton(() => GetFavoritesUseCase(sl()));
    sl.registerLazySingleton(() => GetUserDataUseCase(sl()));
    sl.registerLazySingleton(() => UpdateUserDataUseCase(sl()));
    sl.registerLazySingleton(() => SearchProductUseCase(sl()));
    sl.registerLazySingleton(() => GetCategoryUseCase(sl()));
    sl.registerLazySingleton(() => GetClotheProductUseCase(sl()));
    sl.registerLazySingleton(() => GetLightingProductUseCase(sl()));
    sl.registerLazySingleton(() => GetPreventCoronaProductUseCase(sl()));
    sl.registerLazySingleton(() => GetSportsProductUseCase(sl()));
    sl.registerLazySingleton(() => GetElectronicProductUseCase(sl()));
    ///repository
    sl.registerLazySingleton<BaseLoginRepository>(() => LoginRepository(sl()));
    sl.registerLazySingleton<BaseShopRepository>(() => SHopRepository(sl()));
    sl.registerLazySingleton<BaseCategoriesRepository>(() => SHopCategoriesRepository(sl()));

    ///data source
    sl.registerLazySingleton<BaseLoginRemoteDataSource>(
        () => LoginRemoteDataSource());
    sl.registerLazySingleton<BaseHomeRemoteDataSource>(
        () => HomeRemoteDataSource());
    sl.registerLazySingleton<BaseCategoriesRemoteDataSource>(() =>CategoriesRemoteDataSource());
  }
}
