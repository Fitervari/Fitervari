import 'dart:async';
import 'dart:convert';

import 'package:fitervari_flutter/components/utils.dart';
import 'package:fitervari_flutter/custom_code/widgets/http.dart';
import 'package:fitervari_flutter/data/exercise.dart';
import 'package:fitervari_flutter/data/workoutsession.dart';
import 'package:fitervari_flutter/pause_page/pause_page_widget.dart';
import 'package:web_socket_channel/io.dart';

import '../components/workout_card_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../plan_page/plan_page_widget.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class ExercisePageWidget extends StatefulWidget {
  ExercisePageWidget({
    Key? key,
    required this.exercises,
    this.planid = 0,
  }) : super(key: key);
  List<Exercise> exercises;
  int planid = 0;
  @override
  _ExercisePageWidgetState createState() => _ExercisePageWidgetState();
}

class _ExercisePageWidgetState extends State<ExercisePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _isHours = false;

  final StopWatchTimer _stopWatchTimer = StopWatchTimer(
    mode: StopWatchMode.countUp,
  );
  final _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    print(widget.planid);
    FFAppState().channel.stream.listen((message) {
      print(message);
      var jd = json.decode(message);
      if (jd["device"] == "watch") {
        if (jd["command"] == "start") {
          print("start");
          startExercise();
        } else if (jd["command"] == "stop") {
          print("stop");
          stopExercise();
        }
        if (jd["command"] == "pause") {
          print("pause");
          pauseExercise();
        }
      }
    });
    FFAppState().channel.sink.add(json.encode(
                          {"device": "phone", "command": "exercisesT","exerciseid":widget.exercises.first.id}));
  }

  @override
  void dispose() async {
    super.dispose();
    await _stopWatchTimer.dispose();
    FFAppState().channel = IOWebSocketChannel.connect(Uri.parse(
        'ws://student.cloud.htl-leonding.ac.at/m.rausch-schott/fitervari/api/health/1000'));
  }

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
                          utf8convert(widget.exercises.first.name),
                          style: FlutterFlowTheme.title2,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: StreamBuilder<int>(
                          stream: _stopWatchTimer.rawTime,
                          initialData: _stopWatchTimer.rawTime.value,
                          builder: (context, snap) {
                            final value = snap.data!;
                            final displayTime = StopWatchTimer.getDisplayTime(
                                value,
                                hours: _isHours);
                            return Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    utf8convert(displayTime),
                                    style: const TextStyle(
                                        fontSize: 25,
                                        fontFamily: 'Helvxetica',
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            );
                          },
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
                              Tapactivation: null,
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
                    onPressed: () async{
                      stopExercise();
                                            FFAppState().started =false;

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
                    onPressed: () async {
                      FFAppState().channel.sink.add(
                          json.encode({"device": "phone", "command": "pause"}));
                      pauseExercise();
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
              if (_stopWatchTimer.rawTime.value == 0)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 34),
                  child: FFButtonWidget(
                    onPressed: () async {
                      FFAppState().channel.sink.add(json.encode(
                          {"device": "phone", "command": "exercisesT"}));
                      startExercise();
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
              if (FFAppState().workoutToDo != 1 &&
                  _stopWatchTimer.rawTime.value != 0)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 34),
                  child: FFButtonWidget(
                    onPressed: () async {
                      finishExercise();
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
              if (FFAppState().workoutToDo == 1 &&
                  _stopWatchTimer.rawTime.value != 0)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 34),
                  child: FFButtonWidget(
                    onPressed: () async {
                      completeExercise();
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

  pauseExercise() {
    _stopWatchTimer.onExecute.add(StopWatchExecute.stop);
  }

  startExercise() {
    _stopWatchTimer.onExecute.add(StopWatchExecute.start);
    setState(() => FFAppState().started = true);
    DateTime now = DateTime.now();
    String formattedDate =
        DateFormat('yyyy-MM-dd').format(now) + "T00:00:00.00";
    FFAppState().currentWorkoutSession = new WorkoutSession(
        date:
            "${DateTime.now().year}-0${DateTime.now().month}-${DateTime.now().day}",
        endTime: DateTime.now(),
        id: widget.exercises.first.id,
        startTime: DateTime.now());
    httppostWorkoutSession("urlstr", {}, FFAppState().currentWorkoutSession!);
    FFAppState().currentWorkoutSession!.id;
  }

  finishExercise() async {
    setState(() => FFAppState().started = false);
    widget.exercises.removeAt(0);
    setState(() => FFAppState().workoutToDo = widget.exercises.length - 1);
    await Navigator.pushAndRemoveUntil(
        context,
        PageTransition(
          type: PageTransitionType.fade,
          duration: Duration(milliseconds: 0),
          reverseDuration: Duration(milliseconds: 0),
          child: PausePageWidget(exercises: widget.exercises),
        ),
        (r) => true);
  }

  stopExercise() async{
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
  }
  completeExercise() async {
    setState(() => FFAppState().started = false);
    setState(() => FFAppState().workoutToDo = 0);
    //widget.exercises.removeAt(0);
    DateTime now = DateTime.now();
    String formattedDate =
        DateFormat('yyyy-MM-dd').format(now) + "T00:00:00.00";
    FFAppState().currentWorkoutSession!.endTime = DateTime.now();
    httpputWorkoutSession("urlstr", {}, FFAppState().currentWorkoutSession!);
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
  }
}
