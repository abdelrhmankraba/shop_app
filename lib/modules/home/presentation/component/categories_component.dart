import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shop_app/modules/categories/domain/entities/categories_data.dart';
import 'package:shop_app/modules/categories/presentation/controller/cubit/categories_cubit.dart';

class CategoriesComponent extends StatelessWidget {
  const CategoriesComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCategoriesCubit, ShopCategoriesState>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: ShopCategoriesCubit.get(context).categoriesModel !=null,
          builder: (context) => SizedBox(
            height: 100.0,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) =>
                  buildCategoriesItem(ShopCategoriesCubit.get(context).categoriesModel!.data.dataModel[index]),
              separatorBuilder: (context, index) => const SizedBox(
                width: 10.0,
              ),
              itemCount: ShopCategoriesCubit.get(context).categoriesModel!.data.dataModel.length,
            ),
          ),
          fallback: (context) => const SizedBox(height:100.0,child: Center(child: CircularProgressIndicator())),
        );
      },
    );
  }

  Widget buildCategoriesItem(DataCat model) => Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          CachedNetworkImage(
            height: 100.0,
            width: 100.0,
            fit: BoxFit.cover,
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
          Container(
            width: 100.0,
            color: Colors.black.withOpacity(0.7),
            child: DefaultTextStyle(
              textAlign: TextAlign.center,
              maxLines: 1,
              style: const TextStyle(
                color: Colors.white,
                overflow: TextOverflow.ellipsis,
              ),
              child: AnimatedTextKit(
                animatedTexts: [
                  ScaleAnimatedText(model.name),
                ],
                repeatForever: true,
              ),
            ),
          ),
        ],
      );
}
