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
