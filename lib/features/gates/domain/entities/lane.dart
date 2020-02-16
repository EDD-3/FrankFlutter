import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'lane_type.dart';

class Lane extends Equatable {
  final int maximumLanes;
  final LaneType standarLane;
  final LaneType fastLane;
  final LaneType readyLane;
  final LaneType sentriLane;

  Lane(
      {@required this.maximumLanes,
      @required this.standarLane,
      @required this.fastLane,
      @required this.readyLane,
      @required this.sentriLane,
    });

  @override
  List<Object> get props =>
      [maximumLanes, standarLane, fastLane, readyLane, sentriLane];
}
