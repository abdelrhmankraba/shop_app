import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/utils/colors.dart';
import 'package:shop_app/modules/home/presentation/controller/shop_home_cubit.dart';
import 'package:shop_app/modules/login_and_register/presentation/component/component.dart';
import 'package:shop_app/modules/login_and_register/presentation/component/toast.dart';


class UpdateScreen extends StatelessWidget {
  const UpdateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var nameController = TextEditingController();
    var emailController = TextEditingController();
    var phoneController = TextEditingController();
    return BlocConsumer<ShopHomeCubit, ShopHomeState>(
        listener: (context, state) {
          if(state is ShopSuccessUpdateUserState)
          {
            if(ShopHomeCubit.get(context).userModel != null) {
              showToast(text: ShopHomeCubit.get(context).userModel!.message.toString(), state: ToastState.SUCCESS);
              Navigator.pop(context);
            }
          }
        },
        builder: (context, state) {
          var model = ShopHomeCubit.get(context).userModel;
          nameController.text = model!.data!.name;
          emailController.text = model.data!.email;
          phoneController.text = model.data!.phone;

          return Scaffold(
            appBar: AppBar(),
            body: ConditionalBuilder(
              condition: ShopHomeCubit.get(context).userModel != null,
              builder: (context) => Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        if(state is ShopLoadingUpdateUserState)
                          const LinearProgressIndicator(),
                        const SizedBox(
                          height: 20.0,
                        ),
                        defaultTextForm(
                          controller: nameController,
                          keyboardType: TextInputType.name,
                          label: 'Name',
                          prefix: Icons.person,
                          onTap: () {},
                          onChange: (value) {},
                          onSubmit: (value) {},
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'name must be not empty';
                            }
                          },
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        defaultTextForm(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          label: 'Email',
                          prefix: Icons.email,
                          onTap: () {},
                          onChange: (value) {},
                          onSubmit: (value) {},
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'email must be not empty';
                            }
                          },
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        defaultTextForm(
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          label: 'Phone',
                          prefix: Icons.phone,
                          onTap: () {},
                          onChange: (value) {},
                          onSubmit: (value) {},
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'phone must be not empty';
                            }
                          },
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        defaultButton(
                          radius: 5.0,
                          text: 'update',
                          background: colorBottom,
                          function: () {
                            if(formKey.currentState!.validate()){
                              ShopHomeCubit.get(context).updateUserData(
                                name: nameController.text,
                                email: emailController.text,
                                phone: phoneController.text,
                              );
                            }
                          },
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              fallback: (context) =>
              const Center(child: CircularProgressIndicator()),
            ),
          );
        },
      );
  }
}
