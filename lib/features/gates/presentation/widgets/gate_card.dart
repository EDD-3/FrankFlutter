import 'package:flutter/material.dart';
import 'package:news_app/features/gates/data/models/gate_model.dart';

class GateCard extends StatelessWidget {
  final List<GateModel> gateList;
  final int index;
  const GateCard({
    Key key,
    @required this.gateList,
    @required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(2, 2, 0, 0),
      height: 50.0,
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
                    children: <Widget>[
                      Icon(
                        Icons.lock_open,
                        color: Colors.greenAccent,
                        size: 40.0,
                      ),
                      Flexible(
                        child: Column(children: <Widget>[
                          Text(
                            gateList[index].crossingName,
                            style: TextStyle(fontSize: 20.0),
                          ),
                          Text(gateList[index].portStatus,
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.grey[500],
                              )),
                        ]),
                      ),
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
                        style: TextStyle(fontSize: 20.0),
                      ),
                      Text(gateList[index].date,
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
                        style: TextStyle(fontSize: 20.0),
                      ),
                      Text(gateList[index].hoursOpen,
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