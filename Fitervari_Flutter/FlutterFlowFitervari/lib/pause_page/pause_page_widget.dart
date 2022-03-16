import 'package:fitervari_flutter/components/utils.dart';
import 'package:fitervari_flutter/custom_code/widgets/http.dart';
import 'package:fitervari_flutter/data/exercise.dart';
import 'package:fitervari_flutter/data/workoutsession.dart';
import 'package:fitervari_flutter/exercise_page/exercise_page_widget.dart';

import '../components/workout_card_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../plan_page/plan_page_widget.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class PausePageWidget extends StatefulWidget {
  PausePageWidget({
    Key? key,
    required this.exercises,
  }) : super(key: key);
  List<Exercise> exercises;
  @override
  _PausePageWidgetState createState() => _PausePageWidgetState();
}

class _PausePageWidgetState extends State<PausePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _isHours = false;

  StopWatchTimer _stopWatchTimer = StopWatchTimer(
    mode: StopWatchMode.countDown,
    presetMillisecond: StopWatchTimer.getMilliSecFromSecond(8),
    onEnded: () {},
  );
  final _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _stopWatchTimer.onExecute.add(StopWatchExecute.start);
  }

  @override
  void dispose() async {
    super.dispose();
    await _stopWatchTimer.dispose();
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
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 34),
            child: StreamBuilder<int>(
              stream: _stopWatchTimer.rawTime,
              initialData: _stopWatchTimer.rawTime.value,
              builder: (context, snap) {
                final value = snap.data!;
                final displayTime =
                    StopWatchTimer.getDisplayTime(value, hours: _isHours);
                print(_stopWatchTimer.rawTime.value);
                return Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        utf8convert(displayTime),
                        style: const TextStyle(
                            fontSize: 40,
                            fontFamily: 'Helvetica',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          if (_stopWatchTimer.rawTime.value >= 2  && _stopWatchTimer.rawTime.value <= 200) FutureBuilder(
                    future: navigate_to_exercise(),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<Widget>> snapshot) {
                      if (snapshot.hasData) {
                        return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: snapshot.data!);
                      } else
                        throw Error();
                    }),

        ],
      ),
    );
  }

  navigate_to_exercise() async {
    await Navigator.pushAndRemoveUntil(
        context,
        PageTransition(
          type: PageTransitionType.fade,
          duration: Duration(milliseconds: 0),
          reverseDuration: Duration(milliseconds: 0),
          child: ExercisePageWidget(exercises: widget.exercises),
        ),
        (r) => true);
  }
}
