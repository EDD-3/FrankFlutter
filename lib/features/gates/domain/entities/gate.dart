import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'lane.dart';

class Gate extends Equatable {
  final DateTime date;
  final String crossingName;
  final String portStatus;
  final Lane commercialLane;
  final Lane passengerLane;
  final Lane pedestrianLane;

  Gate(
      {@required this.crossingName,
      @required this.portStatus,
      @required this.date,
      @required this.commercialLane,
      @required this.passengerLane,
      @required this.pedestrianLane});

  @override
  List<Object> get props => [
        date,
        crossingName,
        portStatus,
        commercialLane,
        passengerLane,
        pedestrianLane
      ];
}
