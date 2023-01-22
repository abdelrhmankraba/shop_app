import 'package:equatable/equatable.dart';

class ChangeFavorites extends Equatable {
  final bool status;
  final String message;

  const ChangeFavorites({required this.status, required this.message});

  @override
  List<Object?> get props => [status, message];
}
