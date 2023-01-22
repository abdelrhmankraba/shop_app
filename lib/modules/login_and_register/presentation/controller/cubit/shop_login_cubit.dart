import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/use_case/base_use_case.dart';
import 'package:shop_app/modules/login_and_register/domain/entities/login.dart';
import 'package:shop_app/modules/login_and_register/domain/use_cases/login_use_case.dart';
import 'package:shop_app/modules/login_and_register/domain/use_cases/register_user_use_case.dart';

part 'shop_login_state.dart';

class ShopLoginCubit extends Cubit<ShopLoginState> {
  ShopLoginCubit(this.getUserDataUseCase, this.registerUserUseCase)
      : super(ShopLoginInitialState());

  static ShopLoginCubit get(context) => BlocProvider.of(context);
  final LoginUseCase getUserDataUseCase;
  final RegisterUserUseCase registerUserUseCase;

  ShopLogin? loginModel;

  void userLogin({
    required String email,
    required String password,
  }) async {
    emit(ShopLoginLoadingState());
    final result =
        await getUserDataUseCase(Parameters(email: email, password: password));

    emit(result.fold((l) {
      return ShopLoginErrorState(l.message);
    }, (r) {
      loginModel = r;
      return ShopLoginSuccessState(r);
    })
    );
  }

  ShopLogin? registerData;

  void userRegister({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    emit(ShopRegisterLoadingState());
    final result = await registerUserUseCase(
        Parameters(name: name, email: email, password: password, phone: phone));

    result.fold((l) {
      return l.message;
    }, (r) {
      emit(ShopRegisterSuccessState(r));
      return registerData = r;
    });
  }

  IconData suffixIcon = Icons.visibility_outlined;
  bool isPassword = true;

  void changeSuffixIcon() {
    isPassword = !isPassword;
    suffixIcon =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ShopPasswordVisibilityState());
  }
}
