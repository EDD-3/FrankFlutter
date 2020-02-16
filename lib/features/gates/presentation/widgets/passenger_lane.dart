import 'package:flutter/material.dart';
import 'package:news_app/features/gates/domain/entities/lane.dart';

import 'lane_type_card.dart';

class PassengerLane extends StatelessWidget {
  const PassengerLane({
    Key key,
    @required this.passengerLane,
  }) : super(key: key);

  final Lane passengerLane;

  @override
  Widget build(BuildContext context) {
    if (passengerLane == null) return Container();

    return Container(
      padding: EdgeInsets.fromLTRB(2, 2, 0, 0),
      width: double.maxFinite,
      child: Card(
        child: Column(
          children: <Widget>[
            Text('Passenger Vehicle Lanes'),
            Text('Maximum lanes: '),
            Text(passengerLane.maximumLanes.toString()),
            LaneTypeCard(
              laneTypeIcon: Icons.directions_car,
              laneTypeName: 'Standard Lane',
              laneType: passengerLane.standarLane,
            ),
            LaneTypeCard(
              laneTypeIcon: Icons.directions_car,
              laneTypeName: 'Sentri Lane',
              laneType: passengerLane.sentriLane,
            ),
            LaneTypeCard(
              laneTypeIcon: Icons.directions_car,
              laneTypeName: 'Ready Lane',
              laneType: passengerLane.readyLane,
            ),
          ],
        ),
      ),
    );
  }
}