import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class LaneType extends Equatable {
  final String updateTime;
  final String operationalStatus;
  final int delayMinutes;
  final int openLanes;

  LaneType(
      {@required this.updateTime,
      @required this.operationalStatus,
      @required this.delayMinutes,
      @required this.openLanes});

  @override
  List<Object> get props =>
      [updateTime, operationalStatus, delayMinutes, openLanes];
}
