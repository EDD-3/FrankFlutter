import 'package:flutter/material.dart';
import 'package:news_app/features/gates/domain/entities/lane.dart';

import 'lane_title.dart';
import 'lane_type_card.dart';

class PedestrainLane extends StatelessWidget {
  const PedestrainLane({
    Key key,
    @required this.pedestrainLane,
    @required this.gateStatus,
  }) : super(key: key);

  final Lane pedestrainLane;
  final String gateStatus;

  @override
  Widget build(BuildContext context) {
    if (pedestrainLane == null || gateStatus == "Closed") return Container();

    return Container(
      padding: EdgeInsets.fromLTRB(2, 2, 0, 0),
      width: double.maxFinite,
      child: Card(
        child: Column(
          children: <Widget>[
            LaneTitle(
              maximumLanes: pedestrainLane.maximumLanes.toString(),
              laneTitle: 'Pedestrain lanes',
              laneTitleBgColor: Colors.cyan,
            ),
            LaneTypeCard(
              laneTypeIcon: Icons.directions_walk,
              laneTypeName: 'Standard Lane',
              laneType: pedestrainLane.standarLane,
              colorIcon: Colors.cyan,
            ),
            LaneTypeCard(
              laneTypeIcon: Icons.directions_walk,
              laneTypeName: 'Ready Lane',
              laneType: pedestrainLane.readyLane,
              colorIcon: Colors.cyan,
            ),
          ],
        ),
      ),
    );
  }
}
