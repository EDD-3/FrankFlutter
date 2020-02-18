import 'package:flutter/material.dart';
import 'package:news_app/core/booleans/check_status.dart';
import 'package:news_app/features/gates/domain/entities/lane.dart';
import 'lane_title.dart';
import 'lane_type_card.dart';

class CommercialLane extends StatelessWidget {
  const CommercialLane({
    Key key,
    @required this.commercialLane,
    @required this.gateStatus,
  }) : super(key: key);

  final Lane commercialLane;
  final String gateStatus;

  @override
  Widget build(BuildContext context) {
    if (isLaneNotOperational(commercialLane, gateStatus)) return Container();

    return Container(
      padding: EdgeInsets.fromLTRB(2, 2, 0, 0),
      width: double.maxFinite,
      child: Card(
        child: Column(
          children: <Widget>[
            LaneTitle(
              maximumLanes: commercialLane.maximumLanes.toString(),
              laneTitle: 'Commercial vehicle lanes',
              laneTitleBgColor: Colors.lightGreen,
            ),
            LaneTypeCard(
              laneTypeIcon: Icons.local_atm,
              laneTypeName: 'Standard Lane',
              laneType: commercialLane.standarLane,
              colorIcon: Colors.lightGreen,
            ),
            LaneTypeCard(
              laneTypeIcon: Icons.local_atm,
              laneTypeName: 'Fast Lane',
              laneType: commercialLane.fastLane,
              colorIcon: Colors.lightGreen,
            ),
          ],
        ),
      ),
    );
  }
}
