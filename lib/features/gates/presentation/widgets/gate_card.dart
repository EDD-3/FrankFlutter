import 'package:flutter/material.dart';
import 'package:news_app/features/gates/data/models/gate_model.dart';

class GateCard extends StatelessWidget {
  final GateModel gateModel;
  const GateCard({
    Key key,
    @required this.gateModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (gateModel.portStatus == 'Closed')
      return buildCard(color: Colors.redAccent, iconData: Icons.lock_outline);
    else
      return buildCard();
  }

  Container buildCard(
      {Color color = Colors.greenAccent, IconData iconData = Icons.lock_open}) {
    if (gateModel.pedestrianLane.standarLane == null)
      return Container(
        padding: EdgeInsets.fromLTRB(2, 2, 0, 0),
        width: double.maxFinite,
        child: Card(
          child: Center(
            child: Text(
              'Not Available',
              style: TextStyle(
                fontSize: 25.0,
              ),
            ),
          ),
        ),
      );
    return Container(
      padding: EdgeInsets.fromLTRB(2, 2, 0, 0),
      width: double.maxFinite,
      child: Card(
          elevation: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Flexible(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Flexible(
                        child: Icon(
                          iconData,
                          color: color,
                          size: 40.0,
                        ),
                      ),
                      Flexible(
                        child: Column(children: <Widget>[
                          Text(
                            gateModel.crossingName,
                            style: TextStyle(fontSize: 19.0),
                          ),
                          Text(gateModel.portStatus,
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.grey[500],
                              )),
                        ]),
                      ),
                      Flexible(
                        child: Column(children: <Widget>[
                          Text(
                            'Update time: ',
                            style: TextStyle(fontSize: 19.0),
                          ),
                          Text(gateModel.pedestrianLane.standarLane.updateTime,
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.grey[500],
                              )),
                        ]),
                      )
                    ],
                  )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Flexible(
                    child: Column(children: <Widget>[
                      Text(
                        'Date',
                        style: TextStyle(fontSize: 19.0),
                      ),
                      Text(gateModel.date,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.grey[500],
                          )),
                    ]),
                  ),
                  Flexible(
                    child: Column(children: <Widget>[
                      Text(
                        'Hours',
                        style: TextStyle(fontSize: 19.0),
                      ),
                      Text(gateModel.hoursOpen,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.grey[500],
                          )),
                    ]),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
