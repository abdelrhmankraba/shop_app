import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/services/services_locator.dart';
import 'package:shop_app/core/shared_preference/cache_helper.dart';
import 'package:shop_app/core/utils/constant.dart';
import 'package:shop_app/modules/home/presentation/controller/shop_home_cubit.dart';
import 'package:shop_app/modules/home/presentation/screens/home_screen.dart';
import 'package:shop_app/modules/login_and_register/presentation/component/background.dart';
import 'package:shop_app/modules/login_and_register/presentation/component/component.dart';
import 'package:shop_app/modules/login_and_register/presentation/component/toast.dart';
import 'package:shop_app/modules/login_and_register/presentation/controller/cubit/shop_login_cubit.dart';
class ShopRegisterScreen extends StatelessWidget {

  const ShopRegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var emailController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var passwordController = TextEditingController();
    return BlocProvider(
      create: (BuildContext context) => sl<ShopLoginCubit>(),
      child: BlocConsumer<ShopLoginCubit, ShopLoginState>(
        listener: (context, state) {
          if (state is ShopRegisterSuccessState) {
            if (state.registerUser.status) {
              showToast(
                text: state.registerUser.message,
                state: ToastState.SUCCESS,
              );

              CacheHelper.saveData(
                  key: 'token', value: state.registerUser.data!.token)
                  .then((value) {
                token = state.registerUser.data!.token;
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const HomeScreen()),
                      (Route<dynamic> route) => false,
                );
                ShopHomeCubit.get(context).getHomeData();
                ShopHomeCubit.get(context).userModel=null;
                ShopHomeCubit.get(context).changeBottom(0, context);
              });
            }
            else {
              showToast(
                text: state.registerUser.message,
                state: ToastState.ERROR,
              );
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Background(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: const Text(
                        "Register",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2661FA),
                            fontSize: 36),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Text(
                      'Register now to browse our hot offers',
                      style: Theme
                          .of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      child: defaultTextForm(
                        controller: nameController,
                        keyboardType: TextInputType.name,
                        label: 'User Name',
                        prefix: Icons.person,
                        onSubmit: (value) {},
                        onChange: (value) {},
                        onTap: () {},
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'please enter your name';
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      child: defaultTextForm(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        label: 'Email Address',
                        prefix: Icons.email_outlined,
                        onSubmit: (value) {},
                        onChange: (value) {},
                        onTap: () {},
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'Email must be not empty';
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      child: defaultTextForm(
                        controller: passwordController,
                        keyboardType: TextInputType.phone,
                        label: 'Password',
                        prefix: Icons.lock_outline,
                        suffix: ShopLoginCubit
                            .get(context)
                            .suffixIcon,
                        suffixPress: () {
                          ShopLoginCubit.get(context).changeSuffixIcon();
                        },
                        onSubmit: (value) {},
                        onChange: (value) {},
                        onTap: () {},
                        isPassword: ShopLoginCubit.get(context).isPassword,
                        validate: (String? value) {
                          if (value!.length < 6) {
                            return 'Password must be not less than 6 digits';
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      child: defaultTextForm(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        label: 'phone',
                        prefix: Icons.phone,
                        onSubmit: (value) {},
                        onChange: (value) {},
                        onTap: () {},
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'please enter your phone';
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    ConditionalBuilder(
                      condition: state is! ShopRegisterLoadingState,
                      builder: (context) => Container(
                        alignment: Alignment.centerRight,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 10),
                        child: defaultButton(
                          background: const Color(0xFF2661FA),
                          width: 150,
                          text: 'register',
                          function: () {
                            if (formKey.currentState!.validate()) {
                              ShopLoginCubit.get(context).userRegister(
                                name: nameController.text,
                                email: emailController.text,
                                password: passwordController.text,
                                phone: phoneController.text,
                              );
                            }
                          },
                          isUpperCase: true,
                          radius: 40.0,
                        ),
                      ),
                      fallback: (context) => const Center(child: CircularProgressIndicator()),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
