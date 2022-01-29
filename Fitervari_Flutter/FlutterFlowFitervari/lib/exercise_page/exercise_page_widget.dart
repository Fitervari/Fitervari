import 'package:fitervari_flutter/data/exercise.dart';

import '../components/workout_card_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../plan_page/plan_page_widget.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExercisePageWidget extends StatefulWidget {
  ExercisePageWidget({
    Key? key,
    required this.exercises,
  }) : super(key: key);
  List<Exercise> exercises;
  @override
  _ExercisePageWidgetState createState() => _ExercisePageWidgetState();
}

class _ExercisePageWidgetState extends State<ExercisePageWidget> {
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
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: Text(
                          widget.exercises.first.name,
                          style: FlutterFlowTheme.title2,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.25,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                            child: WorkoutCardWidget(
                              workoutName: widget.exercises.first.name,
                              workoutDescription:
                                  widget.exercises.first.description,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if ((FFAppState().started) == true)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 10),
                  child: FFButtonWidget(
                    onPressed: () {
                      print('Button pressed ...');
                    },
                    text: 'Abbrechen',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 60,
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
              if ((FFAppState().started) == true)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 10),
                  child: FFButtonWidget(
                    onPressed: () {
                      print('Button pressed ...');
                    },
                    text: 'Pause',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 70,
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
              if ((FFAppState().started) == false)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 34),
                  child: FFButtonWidget(
                    onPressed: () async {
                      setState(() => FFAppState().started = true);
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
              if (functions.checkConditions2((FFAppState().workoutToDo) != 1,
                  (FFAppState().started) == true))
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 34),
                  child: FFButtonWidget(
                    onPressed: () async {
                      setState(() => FFAppState().started = false);
                      widget.exercises.removeAt(0);
                      setState(() => FFAppState().workoutToDo =
                          widget.exercises.length - 1);
                      await Navigator.pushAndRemoveUntil(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                            reverseDuration: Duration(milliseconds: 0),
                            child:
                                ExercisePageWidget(exercises: widget.exercises),
                          ),
                          (r) => true);
                    },
                    text: 'Fertig',
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
              if (functions.checkConditions2((FFAppState().workoutToDo) == 1,
                  (FFAppState().started) == true))
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 34),
                  child: FFButtonWidget(
                    onPressed: () async {
                      setState(() => FFAppState().started = false);
                      setState(() => FFAppState().workoutToDo = 0);
                      widget.exercises.removeAt(0);

                      await Navigator.pushAndRemoveUntil(
                          context,
                          /*MaterialPageRoute(
                              builder: (context) => PlanPageWidget()),
                          (r) => true);*/
                          PageTransition(
                            type: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                            reverseDuration: Duration(milliseconds: 0),
                            child: PlanPageWidget(),
                          ),
                          (r) => true);
                    },
                    text: 'Beenden',
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
