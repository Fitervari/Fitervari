import 'package:fitervari_flutter/data/exercise.dart';
import 'package:fitervari_flutter/data/workoutplan.dart';
import 'package:fitervari_flutter/plan_page/plan_page_widget.dart';

import '../components/workout_card_widget.dart';
import '../exercise_page/exercise_page_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../app_state.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WorkoutPageWidget extends StatefulWidget {
  WorkoutPageWidget({
    Key? key,
    required this.workoutplan,
  }) : super(key: key);
  Workoutplan workoutplan;
  @override
  _WorkoutPageWidgetState createState() => _WorkoutPageWidgetState();
}

class _WorkoutPageWidgetState extends State<WorkoutPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
              child: SingleChildScrollView(
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: getCards(widget.workoutplan)),
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if ((FFAppState().started) == false)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 34),
                  child: FFButtonWidget(
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ExercisePageWidget(
                            exercises: widget.workoutplan.exercises,
                          ),
                        ),
                      );
                    },
                    text: 'Start !',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 90,
                      color: Color(FFAppState().systemColor),
                      textStyle: FlutterFlowTheme.title1.override(
                        fontFamily: 'Roboto Condensed',
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                      ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: 16,
                    ),
                  ),
                ),
              if ((FFAppState().workoutToDo) != 0)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 34),
                  child: FFButtonWidget(
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ExercisePageWidget(
                              exercises: widget.workoutplan.exercises),
                        ),
                      );
                    },
                    text: 'Neustart',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 90,
                      color: Color(FFAppState().systemColor),
                      textStyle: FlutterFlowTheme.title1.override(
                        fontFamily: 'Roboto Condensed',
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                      ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: 16,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

List<Widget> getCards(Workoutplan workoutplan) {
  List<Widget> childs = [];
  for (Exercise exercise in workoutplan.exercises) {
    childs.add(new WorkoutCardWidget(
      workoutName: exercise.name,
      workoutDescription: exercise.description,
    ));
  }
  return childs;
}
