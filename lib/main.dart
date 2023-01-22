import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/dio/dio_helper.dart';
import 'package:shop_app/core/services/services_locator.dart';
import 'package:shop_app/core/shared_preference/cache_helper.dart';
import 'package:shop_app/modules/categories/presentation/controller/cubit/categories_cubit.dart';
import 'package:shop_app/modules/home/presentation/controller/shop_home_cubit.dart';
import 'package:shop_app/modules/home/presentation/screens/splash_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ServicesLocator().init();
  DioHelper.init();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(

      providers: [
        BlocProvider(
          create: (context) =>
          sl<ShopHomeCubit>()..getHomeData(),
        ),
        BlocProvider(
          create: (context) => sl<ShopCategoriesCubit>()..getCategories(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shop App',
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0.0,
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
          ),
          primaryColor: const Color(0xFF2661FA),
        ),
        home: const SplashView(),
      ),
    );
  }
}
