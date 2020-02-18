import 'package:flutter/material.dart';

class LaneTitle extends StatelessWidget {
  final String maximumLanes;
  final String laneTitle;
  final Color laneTitleBgColor;

  const LaneTitle({
    Key key,
    @required this.maximumLanes,
    @required this.laneTitle,
    @required this.laneTitleBgColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TitleDisplayBox(laneTitleBgColor: laneTitleBgColor, laneTitle: laneTitle),
        SizedBox(
          height: 10.0,
        ),
        Text(
          'Maximum lanes: ',
          style: TextStyle(
            fontSize: 17.0,
          ),
        ),
        Text(
          maximumLanes,
          style: TextStyle(fontSize: 18.0, color: Colors.grey[600]),
        ),
      ],
    );
  }
}

class TitleDisplayBox extends StatelessWidget {
  const TitleDisplayBox({
    Key key,
    @required this.laneTitleBgColor,
    @required this.laneTitle,
  }) : super(key: key);

  final Color laneTitleBgColor;
  final String laneTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20.0, right: 20.0),
      decoration: BoxDecoration(
        border: Border.all(width: 0.25, color: Colors.white),
        color: laneTitleBgColor,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      child: Text(
        laneTitle,
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.white,
        ),
      ),
    );
  }
}
