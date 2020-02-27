import 'package:flutter/material.dart';
import 'package:news_app/features/gates/domain/entities/lane_type.dart';

class LaneTypeCard extends StatelessWidget {
  final LaneType laneType;
  final IconData laneTypeIcon;
  final String laneTypeName;
  final Color colorIcon;
  const LaneTypeCard({
    Key key,
    @required this.laneTypeIcon,
    @required this.laneTypeName,
    @required this.laneType,
    @required this.colorIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (laneType == null) return Container();
    return Container(
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        laneTypeName,
                        style: TextStyle(fontSize: 18.0),
                      ),
                      Icon(
                        laneTypeIcon,
                        color: colorIcon,
                        size: 38.0,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 0.25,
                        color: Colors.white,
                      ),
                      color: getDelayBoxColor(),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Delay (minutes): ',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          laneType.delayMinutes.toString(),
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    'Open lanes:',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  Text(
                    laneType.openLanes.toString(),
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  MaterialColor getDelayBoxColor() => (laneType.delayMinutes <= 30)
      ? Colors.green
      : (laneType.delayMinutes <= 60) ? Colors.amber : Colors.red;
}
