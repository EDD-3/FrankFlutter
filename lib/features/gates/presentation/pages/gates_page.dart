import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/messages/messages.dart';
import 'package:news_app/features/gates/presentation/bloc/bloc.dart';
import 'package:news_app/features/gates/presentation/widgets/commercial_lane.dart';
import 'package:news_app/features/gates/presentation/widgets/gate_card.dart';
import 'package:news_app/features/gates/presentation/widgets/passenger_lane.dart';
import 'package:news_app/features/gates/presentation/widgets/pedestrain_lane.dart';
import 'package:news_app/features/news/presentation/widgets/loading_widget.dart';
import '../../../../injection_container.dart';

class GatesPage extends StatefulWidget {
  @override
  _GatesPageState createState() => _GatesPageState();
}

class _GatesPageState extends State<GatesPage> {
  int stateIndex = 0;
  GatesBloc _bloc;
  @override
  void initState() {
    super.initState();
    _bloc = sl<GatesBloc>();
    _bloc.add(GetGatesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Garitas Nogales"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () => _bloc.add(GetGatesEvent()),
          )
        ],
        backgroundColor: Colors.red[600],
      ),
      body: buildBody(),
    );
  }

  BlocProvider<GatesBloc> buildBody() {
    return BlocProvider<GatesBloc>(
      create: (context) => _bloc,
      child: BlocBuilder<GatesBloc, GatesState>(builder: (context, state) {
        if (state is InitialGatesState) {
          return MessageDisplay();
        }

        if (state is GatesLoadingState) {
          return LoadingWidget();
        }

        if (state is GatesLoadedState) {
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                CarouselSlider.builder(
                    viewportFraction: 1.0,
                    aspectRatio: 2.0,
                    onPageChanged: (index) {
                      setState(() {
                        stateIndex = index;
                      });
                    },
                    itemCount: state.gateList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GateCard(
                        gateModel: state.gateList[index],
                      );
                    }),
                PassengerLane(
                  passengerLane: state.gateList[stateIndex].passengerLane,
                  gateStatus: state.gateList[stateIndex].portStatus,
                ),
                PedestrainLane(
                  pedestrainLane: state.gateList[stateIndex].pedestrianLane,
                  gateStatus: state.gateList[stateIndex].portStatus,
                ),
                CommercialLane(
                  commercialLane: state.gateList[stateIndex].commercialLane,
                  gateStatus: state.gateList[stateIndex].portStatus,
                ),
              ],
            ),
          );
        }
        return Container();
      }),
    );
  }
}

class MessageDisplay extends StatelessWidget {
  const MessageDisplay({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(Messages.NO_INFO),
    );
  }
}
