import 'package:news_app/features/gates/data/models/lane_type_model.dart';
import 'package:news_app/features/gates/domain/entities/lane.dart';
import 'package:meta/meta.dart';
import 'package:news_app/features/gates/domain/entities/lane_type.dart';

class LaneModel extends Lane {
  LaneModel({
    @required final int maximumLanes,
    @required final LaneType standarLane,
    @required final LaneType fastLane,
    @required final LaneType readyLane,
    @required final LaneType sentriLane,
  }) : super(
          maximumLanes: maximumLanes,
          standarLane: standarLane,
          fastLane: fastLane,
          sentriLane: sentriLane,
          readyLane: readyLane,
        );

  factory LaneModel.fromJson(Map<String, dynamic> json) {
    if (json['maximum_lanes'] == 'N/A') return null;

    LaneTypeModel fast = json.containsKey('FAST_lanes')
        ? LaneTypeModel.fromJson(json['FAST_lanes'])
        : null;
    LaneTypeModel ready = json.containsKey('ready_lanes')
        ? LaneTypeModel.fromJson(json['ready_lanes'])
        : null;
    LaneTypeModel sentri = json.containsKey('NEXUS_SENTRI_lanes')
        ? LaneTypeModel.fromJson(json['NEXUS_SENTRI_lanes'])
        : null;
    LaneTypeModel standard = json.containsKey('standard_lanes')
        ? LaneTypeModel.fromJson(json['standard_lanes'])
        : null;

    return LaneModel(
      fastLane: fast,
      readyLane: ready,
      sentriLane: sentri,
      maximumLanes: json['maximum_lanes'],
      standarLane: standard,
    );
  }
}
