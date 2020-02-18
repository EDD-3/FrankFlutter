import 'package:flutter/material.dart';
import 'package:news_app/features/gates/domain/entities/lane.dart';
import 'package:news_app/features/gates/presentation/widgets/lane_title.dart';

import 'lane_type_card.dart';

class PassengerLane extends StatelessWidget {
  const PassengerLane(
      {Key key, @required this.passengerLane, @required this.gateStatus})
      : super(key: key);

  final Lane passengerLane;
  final String gateStatus;

  @override
  Widget build(BuildContext context) {
    if (passengerLane == null || gateStatus == 'Closed') return Container();

    return Container(
      padding: EdgeInsets.fromLTRB(2, 2, 0, 0),
      width: double.maxFinite,
      child: Card(
        child: Column(
          children: <Widget>[
            LaneTitle(
              maximumLanes: passengerLane.maximumLanes.toString(),
              laneTitle: 'Passenger vehicle lanes',
              laneTitleBgColor: Colors.blue,
            ),
            LaneTypeCard(
              laneTypeIcon: Icons.directions_car,
              laneTypeName: 'Standard Lane',
              laneType: passengerLane.standarLane,
              colorIcon: Colors.blue,
            ),
            LaneTypeCard(
              laneTypeIcon: Icons.directions_car,
              laneTypeName: 'Sentri Lane',
              laneType: passengerLane.sentriLane,
              colorIcon: Colors.blue,
            ),
            LaneTypeCard(
              laneTypeIcon: Icons.directions_car,
              laneTypeName: 'Ready Lane',
              laneType: passengerLane.readyLane,
              colorIcon: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
