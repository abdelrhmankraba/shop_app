import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app/core/error/failure.dart';

abstract class BaseUseCase<t, parameters> {
  Future<Either<Failure, t>> call(parameters parameters);
}

class NoParameters extends Equatable {
  const NoParameters();

  @override
  List<Object> get props => [];
}

class Parameters extends Equatable{
  final String? email;
  final String? password;
  final String? name;
  final String? phone;
  final int? id;
  final String? text;

  const Parameters({this.email,this.password,this.phone,this.name,this.id,this.text});

  @override
  List<Object?> get props => [email ,password,name,phone,id,text];

}