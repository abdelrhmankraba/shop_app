import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shop_app/core/utils/colors.dart';
import 'package:shop_app/modules/home/domain/entities/home_data.dart';
import 'package:shop_app/modules/home/presentation/controller/shop_home_cubit.dart';
import 'package:shop_app/modules/login_and_register/presentation/component/toast.dart';
class ProductComponent extends StatelessWidget {
  const ProductComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopHomeCubit, ShopHomeState>(
      listener: (context, state) {
        if (state is ShopSuccessChangeFavoritesState) {
          if (!state.changeFavoritesModel.status) {
            showToast(
              text: state.changeFavoritesModel.message,
              state: ToastState.ERROR,
            );
          }
        }

      },

      builder: (context, state) {
        return ConditionalBuilder(
          condition: ShopHomeCubit.get(context).homeDataModel != null,
          builder: (context)=>Container(
            color: Colors.grey[300],
            child: GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 2.0,
              crossAxisSpacing: 2.0,
              childAspectRatio: 1 / 1.5,
              children: List.generate(
                ShopHomeCubit.get(context).homeDataModel!.data.products.length,
                    (index) => buildGridProducts(
                    ShopHomeCubit.get(context).homeDataModel!.data.products[index],
                    context),
              ),
            ),
          ),
          fallback: (context) =>
          const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  Widget buildGridProducts(Product model, context) => Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                CachedNetworkImage(
                  width: double.infinity,
                  height: 150.0,
                  imageUrl: model.image,
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: Colors.grey[400]!,
                    highlightColor: Colors.white,
                    child: Container(
                      height: 150.0,
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
                if (model.discount != 0)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5.0,
                    ),
                    color: Colors.red,
                    child: const Text(
                      'DICOUNT',
                      style: TextStyle(fontSize: 8.0, color: Colors.white),
                    ),
                  ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Text(
                    model.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14.0,
                      height: 1.3,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '${model.price.round()}',
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: defaultColor,
                          fontSize: 12.0,
                        ),
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      if (model.discount != 0)
                        Text(
                          '${model.oldPrice.round()}',
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 10.0,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          ShopHomeCubit.get(context).changeFavorites(model.id);
                        },
                        icon: CircleAvatar(
                          radius: 15.0,
                          backgroundColor:
                              ShopHomeCubit.get(context).favorites[model.id]!
                                  ? colorBottom
                                  : Colors.grey,
                          child: const Icon(
                            Icons.favorite_border,
                            size: 16.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
