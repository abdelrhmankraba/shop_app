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
import 'package:shop_app/modules/login_and_register/presentation/screens/register_screen.dart';

class ShopLoginScreen extends StatelessWidget {
  const ShopLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return BlocProvider(
      create: (BuildContext context) => sl<ShopLoginCubit>(),
      child: BlocConsumer<ShopLoginCubit, ShopLoginState>(
        listener: (context, state) {
          if (state is ShopLoginSuccessState) {
            if (state.loginModel.status) {
              showToast(
                text: state.loginModel.message,
                state: ToastState.SUCCESS,
              );
              CacheHelper.saveData(
                      key: 'token', value: state.loginModel.data!.token)
                  .then((value) {
                token = state.loginModel.data!.token;
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const HomeScreen()),
                  (Route<dynamic> route) => false,
                );
                ShopHomeCubit.get(context).getHomeData();
                ShopHomeCubit.get(context).userModel = null;
                ShopHomeCubit.get(context).changeBottom(0, context);
              });
            } else {
              showToast(
                text: state.loginModel.message,
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
                        "LOGIN",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2661FA),
                            fontSize: 36),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(height:MediaQuery.of(context).size.height * 0.03),
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
                    SizedBox(height:MediaQuery.of(context).size.height * 0.03),
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      child: defaultTextForm(
                        controller: passwordController,
                        keyboardType: TextInputType.phone,
                        label: 'Password',
                        prefix: Icons.lock_outline,
                        suffix: ShopLoginCubit.get(context).suffixIcon,
                        suffixPress: () {
                          ShopLoginCubit.get(context).changeSuffixIcon();
                        },
                        onSubmit: (value) {
                          if (formKey.currentState!.validate()) {
                            ShopLoginCubit.get(context).userLogin(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                          }
                        },
                        onChange: (value) {},
                        onTap: () {},
                        isPassword:
                        ShopLoginCubit.get(context).isPassword,
                        validate: (String? value) {
                          if (value!.length < 6) {
                            return 'Password must be not empty';
                          }
                        },
                      ),
                    ),
                    SizedBox(height:MediaQuery.of(context).size.height * 0.05),
                    ConditionalBuilder(
                      condition: state is! ShopLoginLoadingState,
                      builder: (context) => Container(
                        alignment: Alignment.centerRight,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 10),
                        child: defaultButton(
                          text: 'login',
                          width: 120.0,
                          function: () {
                            if (formKey.currentState!.validate()) {
                              ShopLoginCubit.get(context).userLogin(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                            }
                          },
                          isUpperCase: true,
                          radius: 40.0,
                          background: const Color(0xFF2661FA),
                        ),
                      ),
                      fallback: (context) => const Center(
                          child: CircularProgressIndicator()),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Don\'t have an Account?',
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                      const ShopRegisterScreen()));
                            },
                            child: const Text(
                              'REGISTER',
                              style: TextStyle(
                                color: Color(0xFF2661FA),
                              ),
                            ),
                          ),
                        ],
                      ),
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
