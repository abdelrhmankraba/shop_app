import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/shared_preference/cache_helper.dart';
import 'package:shop_app/core/utils/colors.dart';
import 'package:shop_app/core/utils/constant.dart';
import 'package:shop_app/modules/home/presentation/controller/shop_home_cubit.dart';
import 'package:shop_app/modules/home/presentation/screens/home_screen.dart';
import 'package:shop_app/modules/login_and_register/presentation/screens/login_screen.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;

  _startDelay() {
    _timer = Timer(const Duration(seconds: 4), _getNext);
  }

  _getNext() {
    token = CacheHelper.get(key: 'token');
    if (token != null) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => const HomeScreen()),
              (Route<dynamic> route) => false);
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => const ShopLoginScreen()),
              (Route<dynamic> route) => false);
    }
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShopHomeCubit, ShopHomeState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 300.0,
                  width: double.infinity,
                  child: Image(
                    image: AssetImage(
                      'assets/images/onBoard1.jpg',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                DefaultTextStyle(
                  style: const TextStyle(
                      color: colorBottom,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText('Shop App developed by kraba'),
                    ],
                    onTap: () {},
                    repeatForever: true,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
