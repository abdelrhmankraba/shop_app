import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shop_app/core/utils/colors.dart';
import 'package:shop_app/modules/home/presentation/controller/shop_home_cubit.dart';

Widget buildListProduct(model, context, {bool isOldPrice = true}) => Padding(
  padding: const EdgeInsets.all(20.0),
  child: SizedBox(
    height: 120.0,
    child: Row(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            CachedNetworkImage(
              width: 120.0,
              height: 120.0,
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
            if (model.discount != 0 && isOldPrice)
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 5.0,
                ),
                color: Colors.red,
                child: const Text(
                  'DISCOUNT',
                  style: TextStyle(fontSize: 8.0, color: Colors.white),
                ),
              ),
          ],
        ),
        const SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: Column(
            children: [
              Text(
                model.name!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 14.0,
                  height: 1.3,
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  Text(
                    model.price!.toString(),
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: defaultColor,
                      fontSize: 12.0,
                    ),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  if (model.discount != 0 && isOldPrice)
                    Text(
                      model.oldPrice!.toString(),
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
                      ShopHomeCubit.get(context).changeFavorites(model.id!);
                    },
                    icon: CircleAvatar(
                      radius: 15.0,
                      backgroundColor:
                      ShopHomeCubit.get(context).favorites[model.id]! ? colorBottom : Colors.grey,
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
  ),
);

