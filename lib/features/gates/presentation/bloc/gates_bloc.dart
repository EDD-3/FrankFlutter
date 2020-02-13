import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:news_app/core/usecases/no_params.dart';
import 'package:news_app/features/gates/domain/usecases/get_gate_list.dart';
import './bloc.dart';

class GatesBloc extends Bloc<GatesEvent, GatesState> {
  final GetGateList getGatesList;

  GatesBloc({
    @required this.getGatesList,
  }) : assert(getGatesList != null);

  @override
  GatesState get initialState => InitialGatesState();

  @override
  Stream<GatesState> mapEventToState(
    GatesEvent event,
  ) async* {
    if (event is GetGatesEvent) {
      yield GatesLoadingState();
      final result = await getGatesList.call(NoParams());

      yield result.fold(
          (failure) => GatesErrorState(errorMessage: failure.getMessage()),
          (gateList) => GatesLoadedState(gateList: gateList));
    }
  }
}
