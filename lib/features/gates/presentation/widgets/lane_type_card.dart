import 'package:flutter/material.dart';
import 'package:news_app/features/gates/domain/entities/lane_type.dart';

class LaneTypeCard extends StatelessWidget {
  final LaneType laneType;
  final IconData laneTypeIcon;
  final String laneTypeName;
  const LaneTypeCard({
    Key key,
    @required this.laneTypeIcon,
    @required this.laneTypeName,
    @required this.laneType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (laneType == null) return Container();
    return Container(
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(laneTypeName),
                    Icon(laneTypeIcon),
                  ],
                )
              ],
            ),
            Column(
              children: <Widget>[
                Text('Update time:'),
                Text(laneType.updateTime),
                SizedBox(
                  height: 10.0,
                ),
                Text('Delay in minutes:'),
                Text(laneType.delayMinutes.toString()),
                SizedBox(
                  height: 10.0,
                ),
                Text('Open lanes:'),
                Text(laneType.openLanes.toString()),
                SizedBox(
                  height: 10.0,
                ),
                Text('Operational status:'),
                Text(laneType.operationalStatus)
              ],
            )
          ],
        ),
      ),
    );
  }
}