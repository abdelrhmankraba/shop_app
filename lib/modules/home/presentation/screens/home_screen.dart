import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/shared_preference/cache_helper.dart';
import 'package:shop_app/core/utils/colors.dart';
import 'package:shop_app/core/utils/constant.dart';
import 'package:shop_app/modules/home/presentation/controller/shop_home_cubit.dart';
import 'package:shop_app/modules/home/presentation/screens/search_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    token = CacheHelper.get(key: 'token');
    return BlocConsumer<ShopHomeCubit, ShopHomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ShopHomeCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark,
            ),
            elevation: 0.0,
            title: DefaultTextStyle(
              textAlign: TextAlign.start,
              style: const TextStyle(
                  color: colorBottom,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold),
              child: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText('Shop App'),
                ],
                onTap: () {},
                isRepeatingAnimation: true,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                          const SearchScreen()));
                },
                icon: const Icon(Icons.search),
              ),
            ],
          ),
          body: cubit.bottomScreen[cubit.currentIndex],
          bottomNavigationBar: CurvedNavigationBar(
            height: 45,
            color: const Color(0xFF4C53A5),
            backgroundColor: Colors.white,
            items: const [
              Icon(
                Icons.home,
                size: 30,
                color: Colors.white,
              ),
              Icon(
                Icons.apps,
                size: 30,
                color: Colors.white,
              ),
              Icon(
                Icons.favorite,
                size: 30,
                color: Colors.white,
              ),
              Icon(
                Icons.settings,
                size: 30,
                color: Colors.white,
              ),
            ],
            index: cubit.currentIndex,
            onTap: (index) {
              cubit.changeBottom(index, context);
            },
          ),
        );
      },
    );
  }
}
