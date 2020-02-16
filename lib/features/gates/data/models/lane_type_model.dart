import 'package:flutter/cupertino.dart';
import 'package:news_app/core/booleans/check_status.dart';
import 'package:news_app/features/gates/domain/entities/lane_type.dart';

class LaneTypeModel extends LaneType {
  LaneTypeModel({
    @required final String updateTime,
    @required final String operationalStatus,
    @required final int delayMinutes,
    @required final int openLanes,
  }) : super(
            delayMinutes: delayMinutes,
            openLanes: openLanes,
            operationalStatus: operationalStatus,
            updateTime: updateTime);

  factory LaneTypeModel.fromJson(Map<String, dynamic> json) {

    if (isNotOperational(json['operational_status'])) return null;

    return LaneTypeModel(
        delayMinutes: json['delay_minutes'],
        openLanes: json['lanes_open'],
        operationalStatus: json['operational_status'],
        updateTime: json['update_time']);
  }

}
