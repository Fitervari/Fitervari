import 'dart:convert';

import 'package:fitervari_flutter/data/user.dart';
import 'package:fitervari_flutter/data/workoutplan.dart';
import 'package:fitervari_flutter/exercise_page/exercise_page_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:web_socket_channel/io.dart';

import '../components/bottom_navi_bar_widget.dart';
import '../components/workout_card_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../workout_page/workout_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlanPageWidget extends StatefulWidget {
  const PlanPageWidget({Key? key}) : super(key: key);

  @override
  _PlanPageWidgetState createState() => _PlanPageWidgetState();
}

class _PlanPageWidgetState extends State<PlanPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
                  child: Text(
                    'Übersicht',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.title3,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
              child: SingleChildScrollView(
                child: FutureBuilder(
                    future: getCards(context),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<Widget>> snapshot) {
                      if (snapshot.hasData) {
                        return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: snapshot.data!);
                      } else
                        throw Error();
                    }),
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xFFFAFAFA),
                ),
                child: BottomNaviBarWidget(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Future<List<Widget>> getCards(BuildContext context) async {
  List<Widget> childs = [];
  /*for (User user in await FFAppState().users) {
    FFAppState().mainuser = user;
  }*/
  
  FFAppState().userHealthdata = await FFAppState().healthdata;
  FFAppState().channel = IOWebSocketChannel.connect(Uri.parse(
    'ws://student.cloud.htl-leonding.ac.at/m.rausch-schott/fitervari/api/health/1000'));
  FFAppState().userworkoutsessions = await FFAppState().userworkoutsessions;
  for (Workoutplan plan in await FFAppState().workoutplans) {
    print(plan);
    childs.add(WorkoutCardWidget(
      workoutName: plan.name,
      workoutDescription: "currently no description",
      Tapactivation: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              FFAppState().currentworkoutplan = plan;
              return WorkoutPageWidget(
                  workoutplan: FFAppState().currentworkoutplan!);
            },
          ),
        );
      },
    ));
  }
  return childs;
}