import 'package:equatable/equatable.dart';

abstract class GatesEvent extends Equatable {
  const GatesEvent();
}

class GetGatesEvent extends GatesEvent {
  @override
  List<Object> get props => [];
}
