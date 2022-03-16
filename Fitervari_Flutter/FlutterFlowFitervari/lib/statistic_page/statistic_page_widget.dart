import 'package:fitervari_flutter/components/workout_calendar_widget.dart';
import 'package:fitervari_flutter/components/workout_card_widget.dart';
import 'package:fitervari_flutter/data/line_chart/samples/line_chart_sample2.dart';

import '../components/bottom_navi_bar_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class StatisticPageWidget extends StatefulWidget {
  const StatisticPageWidget({Key? key}) : super(key: key);

  @override
  _StatisticPageWidgetState createState() => _StatisticPageWidgetState();
}

class _StatisticPageWidgetState extends State<StatisticPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(0.1, 0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                            child: Text(
                              FFAppState().selectedDay,
                              style: FlutterFlowTheme.title2.override(
                                fontFamily: 'Poppins',
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                              child: FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 0,
                                borderWidth: 0,
                                buttonSize: 35,
                                icon: Icon(
                                  Icons.ios_share,
                                  color: Color(FFAppState().systemColor),
                                  size: 24,
                                ),
                                onPressed: () async {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          StatisticPageWidget(),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                              child: FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 0,
                                borderWidth: 0,
                                buttonSize: 35,
                                icon: FaIcon(
                                  FontAwesomeIcons.calendarAlt,
                                  color: Color(FFAppState().systemColor),
                                  size: 24,
                                ),
                                onPressed: () async {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          TableEventsExample(),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      custom_widgets.HorizontalDatePicker(
                        width: MediaQuery.of(context).size.width,
                        height: 115,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: 
                    getCards()
                ),
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

List<Widget> getCards() {
  List<Widget> childs = [];
  /*for (Exercise exercise in workoutplan.exercises) {
    childs.add(new WorkoutCardWidget(
      workoutName: exercise.name,
      workoutDescription: exercise.description,
      Tapactivation: null,
    ));
  }*/
  return childs;
}
