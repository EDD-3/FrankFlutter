import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

class NetworkFailure implements Failure{
  final String message;

  NetworkFailure({@required this.message,});

  @override
  List<Object> get props => [message];

}