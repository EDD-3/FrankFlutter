import 'package:news_app/features/gates/data/models/lane_model.dart';
import 'package:news_app/features/gates/domain/entities/gate.dart';
import 'package:news_app/features/gates/domain/entities/lane.dart';
import 'package:meta/meta.dart';

class GateModel extends Gate {
  GateModel(
      {@required String crossingName,
      @required String portStatus,
      @required DateTime date,
      @required Lane commercialLane,
      @required Lane passengerLane,
      @required Lane pedestrianLane})
      : super(
          crossingName: crossingName,
          portStatus: portStatus,
          date: date,
          commercialLane: commercialLane,
          passengerLane: passengerLane,
          pedestrianLane: pedestrianLane,
        );

  factory GateModel.fromJson(Map<String, dynamic> json) {
    LaneModel commercial = json['commercial_vehicle_lanes']
        ? LaneModel.fromJson(json['commercial_vehicle_lanes'])
        : null;
    LaneModel passenger = json['passenger_vehicle_lanes']
        ? LaneModel.fromJson(json['passenger_vehicle_lanes'])
        : null;
    LaneModel pedestrian = json['pedestrian_lanes']
        ? LaneModel.fromJson(json['pedestrian_lanes'])
        : null;

    return GateModel(
      crossingName: json['crossing_name'],
      portStatus: json['port_status'],
      date: json['json'],
      commercialLane: commercial,
      passengerLane: passenger,
      pedestrianLane: pedestrian,
    );
  }
}
