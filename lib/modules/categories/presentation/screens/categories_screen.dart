import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shop_app/modules/categories/domain/entities/categories_data.dart';
import 'package:shop_app/modules/categories/presentation/controller/cubit/categories_cubit.dart';
import 'package:shop_app/modules/categories/presentation/screens/Sportes.dart';
import 'package:shop_app/modules/categories/presentation/screens/clothes.dart';
import 'package:shop_app/modules/categories/presentation/screens/electronic_device.dart';
import 'package:shop_app/modules/categories/presentation/screens/lighting.dart';
import 'package:shop_app/modules/categories/presentation/screens/prevent_corona.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCategoriesCubit, ShopCategoriesState>(
        listener: (context, state) {},
        builder: (context, state) {
          return ConditionalBuilder(
            condition: ShopCategoriesCubit.get(context).categoriesModel !=null,
            builder: (context)=>ListView.separated(
              itemBuilder: (context, index) => buildCategoryItem(
                  ShopCategoriesCubit.get(context).categoriesModel!.data.dataModel[index],
                  context),
              separatorBuilder: (context, index) => Padding(
                padding: const EdgeInsetsDirectional.only(
                  start: 20.0,
                ),
                child: Container(
                  width: double.infinity,
                  height: 1.0,
                  color: Colors.grey[300],
                ),
              ),
              itemCount:
              ShopCategoriesCubit.get(context).categoriesModel!.data.dataModel.length,
            ),
            fallback: (context) => const Center(child: CircularProgressIndicator()),
          );
        },
      );
  }

  Widget buildCategoryItem(DataCat model, context) => Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
            children: [
              CachedNetworkImage(
                width: 80.0,
                height: 80.0,
                imageUrl: model.image,
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Colors.grey[400]!,
                  highlightColor: Colors.white,
                  child: Container(
                    height: 200.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 20.0,
              ),
              DefaultTextStyle(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(model.name),
                  ],
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  if (model.name == 'electrionic devices') {
                    ShopCategoriesCubit.get(context).getElectronicDevices();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                            const ElectronicDeviceScreen()));
                  }
                  if (model.name == 'Prevent Corona') {
                    ShopCategoriesCubit.get(context).getPreventCorona();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                            const PreventCoronaScreen()));
                  }
                  if (model.name == 'sports') {
                    ShopCategoriesCubit.get(context).getSports();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                            const SportScreen()));
                  }
                  if (model.name == 'Lighting') {
                    ShopCategoriesCubit.get(context).getLighting();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                            const LightingScreen()));
                  }
                  if (model.name == 'Clothes') {
                    ShopCategoriesCubit.get(context).getClothes();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                            const ClothesScreen()));
                  }
                },
                icon: const Icon(
                  Icons.arrow_forward_ios,
                ),
              ),
            ],
          ),
      );
}
