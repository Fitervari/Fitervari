import 'dart:convert';

import 'package:fitervari_flutter/components/utils.dart';
import 'package:fitervari_flutter/data/data.dart';
import 'package:fitervari_flutter/plan_page/plan_page_widget.dart';
import 'package:fitervari_flutter/workout_page/workout_page_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:fitervari_flutter/data/workoutplan.dart';
import '../exercise_page/exercise_page_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WorkoutCardWidget extends StatefulWidget {
  WorkoutCardWidget({
    Key? key,
    context = null,
    exercise = null,
    this.workoutName = '',
    this.workoutText = '',
    this.workoutDescription = '',
    this.setnumber = 0,
    required this.Tapactivation,
  }) : super(key: key);
  BuildContext? context;
  Exercise? exercise;
  final String workoutName;
  final String workoutText;
  final String workoutDescription;
  final int setnumber;
  Function? Tapactivation;
  @override
  _WorkoutCardWidgetState createState() => _WorkoutCardWidgetState();
}

class _WorkoutCardWidgetState extends State<WorkoutCardWidget> {
  bool _isElevated = true;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 20),
      child: GestureDetector(
        onTap: () {
          setState(() {
            _isElevated = !_isElevated;
          });
          if (widget.Tapactivation != null) widget.Tapactivation!();
        },
        child: Stack(children: [
          Positioned(
              child: AnimatedContainer(
              duration: const Duration(microseconds: 150),
              width: MediaQuery.of(context).size.width*0.92,
              height: 184,
              decoration: BoxDecoration(
                color: Color(FFAppState().systemColor),
                borderRadius: BorderRadius.circular(20),
                boxShadow: _isElevated
                    ? [
                        BoxShadow(
                          blurRadius: 15,
                          //color: Colors.grey[500]!,
                          offset: Offset(4, 4),
                          spreadRadius: 1,
                        ),
                        const BoxShadow(
                          color: Colors.white,
                          offset: Offset(-4, -4),
                          blurRadius: 15,
                          spreadRadius: 1,
                        )
                      ]
                    : null,
              ),
              child: Container(
                width: 100,
                height: 20,
                decoration: BoxDecoration(
                  color: Color(0x65090F13),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 2),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                "",//utf8convert("${widget.setnumber}/${widget.exercise!.exerciseSets.length.toString()} Sets"),
                                style: FlutterFlowTheme.title1.override(
                                  fontFamily: 'Lexend Deca',
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.chevron_right_rounded,
                              color: Colors.white,
                              size: 24,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0,
            child: AnimatedContainer(
              duration: const Duration(microseconds: 150),
              width: MediaQuery.of(context).size.width*0.92,
              height: 184,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: Image.asset(
                    'assets/images/john-arano-h4i9G-de7Po-unsplash.jpg',
                  ).image,
                ),
                boxShadow: _isElevated
                    ? [
                        BoxShadow(
                          blurRadius: 15,
                          color: Colors.grey[500]!,
                          offset: Offset(4, 4),
                          spreadRadius: 1,
                        ),
                        const BoxShadow(
                          color: Colors.white,
                          offset: Offset(-4, -4),
                          blurRadius: 15,
                          spreadRadius: 1,
                        )
                      ]
                    : null,
              ),
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Color(0x65090F13),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 2),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                utf8convert(widget.workoutName),
                                style: FlutterFlowTheme.title1.override(
                                  fontFamily: 'Lexend Deca',
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.chevron_right_rounded,
                              color: Colors.white,
                              size: 24,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 4, 16, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                utf8convert(widget.workoutDescription),
                                style: FlutterFlowTheme.bodyText2.override(
                                  fontFamily: 'Lexend Deca',
                                  color: Color(0xFF39D2C0),
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 4, 16, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                                child: Text(
                                  utf8convert(widget.workoutText),
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(16, 4, 16, 16),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 4),
                                      child: Text(
                                        //'10:00am'
                                        "",
                                        style: FlutterFlowTheme.title3.override(
                                          fontFamily: 'Lexend Deca',
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
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
                    ],
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
