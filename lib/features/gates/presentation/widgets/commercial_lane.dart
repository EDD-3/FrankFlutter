import 'package:flutter/material.dart';
import 'package:news_app/features/gates/domain/entities/lane.dart';

import 'lane_type_card.dart';

class CommercialLane extends StatelessWidget {
  const CommercialLane({
    Key key,
    @required this.commercialLane,
  }) : super(key: key);

  final Lane commercialLane;

  @override
  Widget build(BuildContext context) {
    if (commercialLane == null) return Container();

    return Container(
      padding: EdgeInsets.fromLTRB(2, 2, 0, 0),
      width: double.maxFinite,
      child: Card(
        child: Column(
          children: <Widget>[
            Text('Commercial Vehicle Lanes'),
            Text('Maximum lanes: '),
            Text(commercialLane.maximumLanes.toString()),
            LaneTypeCard(
              laneTypeIcon: Icons.local_atm,
              laneTypeName: 'Standard Lane',
              laneType: commercialLane.standarLane,
            ),
            LaneTypeCard(
              laneTypeIcon: Icons.local_atm,
              laneTypeName: 'Fast Lane',
              laneType: commercialLane.fastLane,
            ),
          ],
        ),
      ),
    );
  }
}