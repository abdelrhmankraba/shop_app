import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/modules/home/presentation/component/component.dart';
import 'package:shop_app/modules/home/presentation/controller/shop_home_cubit.dart';


class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopHomeCubit , ShopHomeState>(
      listener: (context , state){},
      builder: (context , state){
        return ConditionalBuilder(
          condition: ShopHomeCubit.get(context).favoriteModel != null && ShopHomeCubit.get(context).homeDataModel !=null,
          builder:(context) => ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context , index) => buildListProduct(ShopHomeCubit.get(context).favoriteModel!.data!.data![index].product,context),
            separatorBuilder: (context , index) => Padding(
              padding: const EdgeInsetsDirectional.only(
                start: 20.0,
              ),
              child: Container(
                width: double.infinity,
                height: 1.0,
                color: Colors.grey[300],
              ),
            ),
            itemCount: ShopHomeCubit.get(context).favoriteModel!.data!.data!.length,
          ),
          fallback:(context) =>
          const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }



}
