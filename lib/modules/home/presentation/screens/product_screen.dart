import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/core/shared_preference/cache_helper.dart';
import 'package:shop_app/core/utils/colors.dart';
import 'package:shop_app/core/utils/constant.dart';
import 'package:shop_app/modules/home/presentation/component/banner_component.dart';
import 'package:shop_app/modules/home/presentation/component/categories_component.dart';
import 'package:shop_app/modules/home/presentation/component/product_component.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    token = CacheHelper.get(key: 'token');
    return builderWidget(context);
  }

  Widget builderWidget(context) => SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BannerComponent(), //use cubit
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: AnimatedTextKit(
                      animatedTexts: [
                        ColorizeAnimatedText(
                          'Categories',
                          textStyle: colorizeTextStyle,
                          colors: colorizeColors,
                        ),
                      ],
                      repeatForever: true,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const CategoriesComponent(),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: AnimatedTextKit(
                      animatedTexts: [
                        ColorizeAnimatedText(
                          'New Products',
                          textStyle: colorizeTextStyle,
                          colors: colorizeColors,
                        ),
                      ],
                      repeatForever: true,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const ProductComponent(),
          ],
        ),
      );
}
