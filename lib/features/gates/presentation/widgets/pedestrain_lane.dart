import 'package:flutter/material.dart';
import 'package:news_app/features/gates/domain/entities/lane.dart';

import 'lane_type_card.dart';

class PedestrainLane extends StatelessWidget {
  const PedestrainLane({
    Key key,
    @required this.pedestrainLane,
  }) : super(key: key);

  final Lane pedestrainLane;

  @override
  Widget build(BuildContext context) {
    if (pedestrainLane == null) return Container();

    return Container(
      padding: EdgeInsets.fromLTRB(2, 2, 0, 0),
      width: double.maxFinite,
      child: Card(
        child: Column(
          children: <Widget>[
            Text('Pedestrain Lanes'),
            Text('Maximum lanes: '),
            Text(pedestrainLane.maximumLanes.toString()),
            LaneTypeCard(
              laneTypeIcon: Icons.directions_walk,
              laneTypeName: 'Standard Lane',
              laneType: pedestrainLane.standarLane,
            ),
            LaneTypeCard(
              laneTypeIcon: Icons.directions_walk,
              laneTypeName: 'Ready Lane',
              laneType: pedestrainLane.readyLane,
            ),
          ],
        ),
      ),
    );
  }
}