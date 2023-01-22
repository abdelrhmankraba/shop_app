import 'package:equatable/equatable.dart';

class ShopLogin extends Equatable {
  final bool status;
  final String message;
  final UserDate? data;

  const ShopLogin(
      {required this.status, required this.message, required this.data});

  @override
  List<Object?> get props => [status, message, data];
}

class UserDate extends Equatable {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String image;
  final String token;

  const UserDate({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
    required this.token,
  });

  @override
  List<Object?> get props => [id, name, email, phone, image];
}
