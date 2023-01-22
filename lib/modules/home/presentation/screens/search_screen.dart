import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/modules/home/presentation/component/component.dart';
import 'package:shop_app/modules/home/presentation/controller/shop_home_cubit.dart';
import 'package:shop_app/modules/login_and_register/presentation/component/component.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var searchController = TextEditingController();
    return BlocConsumer<ShopHomeCubit, ShopHomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  defaultTextForm(
                    controller: searchController,
                    keyboardType: TextInputType.text,
                    label: 'Search',
                    prefix: Icons.search,
                    onChange: (value){},
                    onTap: (){},
                    onSubmit: (String text){
                      ShopHomeCubit.get(context).search(text:text);
                    },
                    validate: (String value){
                      if(value.isEmpty){
                        return 'enter text to search';
                      }
                    },
                  ),
                  const SizedBox(height: 10.0,),
                  if(state is SearchLoadingState)
                    const LinearProgressIndicator(),
                  const SizedBox(height: 10.0,),
                  if(state is SearchSuccessState)
                    Expanded(
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context , index) => buildListProduct(ShopHomeCubit.get(context).searchModel!.data!.data![index],context,isOldPrice: false),
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
                        itemCount:ShopHomeCubit.get(context).searchModel!.data!.data!.length,
                      ),
                    ),
                  if(state is SearchErrorState)
                    Center(child: Text(state.error)),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
