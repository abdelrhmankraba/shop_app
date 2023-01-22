part of 'shop_login_cubit.dart';

abstract class ShopLoginState {
  const ShopLoginState();
}

class ShopLoginInitialState extends ShopLoginState {}

class ShopLoginLoadingState extends ShopLoginState {}

class ShopLoginSuccessState extends ShopLoginState {
  final ShopLogin loginModel;

  ShopLoginSuccessState(this.loginModel);
}

class ShopLoginErrorState extends ShopLoginState {
  final String error;

  ShopLoginErrorState(this.error);
}

class ShopRegisterLoadingState extends ShopLoginState {}

class ShopRegisterSuccessState extends ShopLoginState {
  final ShopLogin registerUser;

  ShopRegisterSuccessState(this.registerUser);
}

class ShopRegisterErrorState extends ShopLoginState {
  final String error;

  ShopRegisterErrorState(this.error);
}

class ShopPasswordVisibilityState extends ShopLoginState {}
