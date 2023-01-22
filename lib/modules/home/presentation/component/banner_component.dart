import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/modules/home/presentation/controller/shop_home_cubit.dart';

class BannerComponent extends StatelessWidget {
  const BannerComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShopHomeCubit, ShopHomeState>(
      builder: (context, state) {
        return ConditionalBuilder(
          condition: ShopHomeCubit.get(context).homeDataModel != null,
          builder: (context) => CarouselSlider(
            items: ShopHomeCubit.get(context)
                .homeDataModel!
                .data
                .banners
                .map((e) => CachedNetworkImage(
                      width: double.infinity,
                      fit: BoxFit.cover,
                      imageUrl: e.image,
                      errorWidget: (context, url, error) => const Icon(
                        Icons.error,
                        color: Colors.white,
                      ),
                    ))
                .toList(),
            options: CarouselOptions(
              height: 250.0,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(seconds: 1),
              autoPlayCurve: Curves.fastOutSlowIn,
              scrollDirection: Axis.horizontal,
              viewportFraction: 1.0,
            ),
          ),
          fallback: (context) =>
              const SizedBox(height:250.0,child:Center(child: CircularProgressIndicator())),
        );
      },
    );
  }
}
