import 'package:wear/wear.dart';
import 'package:flutter/material.dart';
import 'package:workout/workout.dart';

import 'http.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final workout = Workout();
  final features = [
    WorkoutFeature.heartRate,
    WorkoutFeature.calories,
    WorkoutFeature.steps,
    WorkoutFeature.distance,
    WorkoutFeature.speed,
  ];

  double heartRate = 0;
  double calories = 0;
  double steps = 0;
  double distance = 0;
  double speed = 0;
  bool started = false;

  _MyAppState() {
    workout.stream.listen((event) {
      // ignore: avoid_print
      print('${event.feature}: ${event.value}');
      switch (event.feature) {
        case WorkoutFeature.unknown:
          return;
        case WorkoutFeature.heartRate:
          setState(() {
            heartRate = event.value;
            sendHealthData(0, heartRate);
          });
          break;
        case WorkoutFeature.calories:
          setState(() {
            calories = event.value;
            sendHealthData(1, calories);
          });
          break;
        case WorkoutFeature.steps:
          setState(() {
            steps = event.value;
          });
          break;
        case WorkoutFeature.distance:
          setState(() {
            distance = event.value;
          });
          break;
        case WorkoutFeature.speed:
          setState(() {
            speed = event.value;
          });
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: [
              const Spacer(),
              Text('Heart rate: $heartRate'),
              Text('Calories: $calories'),
              Text('Steps: $steps'),
              Text('Distance: $distance'),
              Text('Speed: $speed'),
              const Spacer(),
              TextButton(
                onPressed: () => setState(() {
                  started = !started;
                  if (started) {
                    workout.start(features);
                  } else {
                    workout.stop();
                  }
                }),
                child: Text(started ? 'Stop' : 'Start'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}/*
import 'package:flutter/material.dart';
import 'package:wear/wear.dart';
import 'package:wearos_client/http.dart';
import 'http.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: WatchShape(
            builder: (context, shape, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Shape: ${shape == WearShape.round ? 'round' : 'square'}',
                  ),
                  child,
                ],
              );
            },
            child: AmbientMode(
              builder: (context, mode, child) {
                return TextButton(
                  onPressed: () => httptest(),
                  child: const Text(
                    'http',
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
*/