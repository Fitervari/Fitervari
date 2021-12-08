import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../services/services.dart';
import '../shared/shared.dart';
import '../screens/screens.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ExerciseScreen extends StatefulWidget {
  @override
  State<ExerciseScreen> createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  var started = true;
  var paused = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(15, 30, 15, 0),
          child: Column(
            children: [
              PlanItem(),
              Visibility(
                maintainState: true,
                visible: !started,
                child: Container(
                  height: 120,
                  width: 400,
                  child: Card(
                    color: Colors.yellow,
                    child: InkWell(
                      onTap: () => {
                        print("$started"),
                        started = true,
                      },
                      child: Container(
                        height: 150,
                        width: 400,
                        child: const Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(child: Text("Start")),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: started,
                child: Container(
                  height: 100,
                  width: 400,
                  child: Card(
                    color: Colors.yellow,
                    child: InkWell(
                      onTap: () => {paused = !paused, print("$paused")},
                      child: Container(
                        height: 100,
                        width: 400,
                        child: const Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Pause"),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: started,
                child: Container(
                  height: 120,
                  width: 400,
                  child: Card(
                    color: Colors.yellow,
                    child: InkWell(
                      onTap: () => {started = true, print("fertig")},
                      child: Container(
                        height: 120,
                        width: 400,
                        child: const Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Fertig"),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<Widget> _plans() {
  return [1].map((v) => PlanItem()).toList();
}
