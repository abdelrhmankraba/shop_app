import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/utils/constant.dart';
import 'package:shop_app/modules/home/presentation/controller/shop_home_cubit.dart';
import 'package:shop_app/modules/home/presentation/screens/update_screen.dart';
import 'package:shop_app/modules/login_and_register/presentation/component/component.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var nameController = TextEditingController();
    var emailController = TextEditingController();
    var phoneController = TextEditingController();
    return BlocConsumer<ShopHomeCubit, ShopHomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        if(ShopHomeCubit.get(context).userModel != null){
          nameController.text = ShopHomeCubit.get(context).userModel!.data!.name;
          emailController.text = ShopHomeCubit.get(context).userModel!.data!.email;
          phoneController.text = ShopHomeCubit.get(context).userModel!.data!.phone;
        }

        return ConditionalBuilder(
          condition:ShopHomeCubit.get(context).userModel !=null,
          builder: (context) =>
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Profile Data',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        defaultTextForm(
                          readOnly: true,
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
                          readOnly: true,
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
                          readOnly: true,
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
                        const SizedBox(
                          height: 30.0,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (
                                    BuildContext context) => const UpdateScreen()));
                          },
                          child: Row(
                            children: const[
                               Text(
                                'Update',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              Spacer(),
                              Icon(Icons.arrow_forward_ios),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        GestureDetector(
                          onTap: () {
                            // CacheHelper.removeData(key: 'token',).then((value){
                            //   if(value){
                            //     navigateAndFinish(context, const ShopLoginScreen());
                            //   }
                            // });
                            signOut(context);
                          },
                          child: Row(
                            children: const [
                              Text(
                                'Logout',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              Spacer(),
                              Icon(Icons.arrow_forward_ios),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          fallback: (context) =>
          const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
