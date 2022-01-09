import '../components/workout_card_widget.dart';
import '../exercise_page/exercise_page_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WorkoutPageWidget extends StatefulWidget {
  const WorkoutPageWidget({Key? key}) : super(key: key);

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
                          FFAppState().workoutname,
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
                              workoutName: 'Example',
                              workoutDescription: 'disc',
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
              if ((FFAppState().started) == false)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 34),
                  child: FFButtonWidget(
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ExercisePageWidget(),
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
              if ((FFAppState().workoutToDo) == 0)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 34),
                  child: FFButtonWidget(
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ExercisePageWidget(),
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
