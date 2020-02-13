import 'package:equatable/equatable.dart';
import 'package:news_app/features/gates/data/models/gate_model.dart';
import 'package:meta/meta.dart';

abstract class GatesState extends Equatable {
  const GatesState();
}

class InitialGatesState extends GatesState {
  @override
  List<Object> get props => [];
}

class GatesLoadingState extends GatesState {
  @override
  List<Object> get props => [];
}

class GatesLoadedState extends GatesState {
  final List<GateModel> gateList;
  GatesLoadedState({@required this.gateList});

  @override
  List<Object> get props => [gateList];
}

class GatesErrorState extends GatesState {
  final String errorMessage;

  GatesErrorState({@required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
