import 'dart:async';
import 'dart:convert';

import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:health/health.dart';
import 'package:wearos_client/http.dart';
import 'healthdata.dart';

void main() => runApp(HealthApp());
import 'package:wearos_client/shadowbutton.dart';
import 'package:web_socket_channel/io.dart';
import 'healthdata.dart';
import 'package:web_socket_channel/status.dart' as status;

    'ws://student.cloud.htl-leonding.ac.at/m.rausch-schott/fitervari/api/health/1000'));
bool exercises = false;
bool stoped = false;
void main() async {
  runApp(HealthApp());
}

class HealthApp extends StatefulWidget {
  @override
  _HealthAppState createState() => _HealthAppState();
}

enum AppState {
  DATA_NOT_FETCHED,
  FETCHING_DATA,
  DATA_READY,
  NO_DATA,
  AUTH_NOT_GRANTED,
  DATA_ADDED,
  DATA_NOT_ADDED,
  STEPS_READY,
}

class _HealthAppState extends State<HealthApp> {
  List<HealthDataPoint> _healthDataList = [];
  AppState _state = AppState.DATA_NOT_FETCHED;
  int _nofSteps = 10;
  double _mgdl = 10.0;
  int _mgdl = 10;
  late final TextEditingController _controller;
  String value = '';
  // create a HealthFactory for use in the app
  HealthFactory health = HealthFactory();

  /// Fetch data points from the health plugin and show them in the app.
  Future fetchData() async {
    setState(() => _state = AppState.FETCHING_DATA);

    // define the types to get
    final types = [
      HealthDataType.STEPS,
      HealthDataType.WEIGHT,
      HealthDataType.HEIGHT,
      HealthDataType.BLOOD_GLUCOSE,
      // Uncomment this line on iOS - only available on iOS
      // HealthDataType.DISTANCE_WALKING_RUNNING,
    ];

    // with coresponsing permissions
    final permissions = [
      HealthDataAccess.READ,
      HealthDataAccess.READ,
      HealthDataAccess.READ,
      HealthDataAccess.READ,
    ];

    // get data within the last 24 hours
    final now = DateTime.now();
    final yesterday = now.subtract(Duration(days: 1));

    // requesting access to the data types before reading them
    // note that strictly speaking, the [permissions] are not
    // needed, since we only want READ access.
    bool requested =
        await health.requestAuthorization(types, permissions: permissions);

    if (requested) {
      try {
        // fetch health data
        List<HealthDataPoint> healthData =
            await health.getHealthDataFromTypes(yesterday, now, types);

        // save all the new data points (only the first 100)
        _healthDataList.addAll((healthData.length < 100)
            ? healthData
            : healthData.sublist(0, 100));
      } catch (error) {
        print("Exception in getHealthDataFromTypes: $error");
      }

      // filter out duplicates
      _healthDataList = HealthFactory.removeDuplicates(_healthDataList);

      // print the results
      //_healthDataList.forEach((x) => print(x));

      // update the UI to display the results
      setState(() {
        _state =
            _healthDataList.isEmpty ? AppState.NO_DATA : AppState.DATA_READY;
      });
      print(json.encode(_healthDataList));
      //WearableCommunicator.sendMessage({"text": json.encode(_healthDataList)});
    } else {
      print("Authorization not granted");
      setState(() => _state = AppState.DATA_NOT_FETCHED);
    }
  }

  /// Add some random health data.
  Future addData() async {
    final now = DateTime.now();
    final earlier = now.subtract(Duration(minutes: 5));

    _nofSteps = Random().nextInt(10);
    final types = [HealthDataType.STEPS, HealthDataType.HEART_RATE];
    final rights = [HealthDataAccess.WRITE, HealthDataAccess.WRITE];
    final permissions = [
      HealthDataAccess.READ_WRITE,
      HealthDataAccess.READ_WRITE
    ];
    bool? hasPermissions =
        await HealthFactory.hasPermissions(types, permissions: rights);
    if (hasPermissions == false) {
      await health.requestAuthorization(types, permissions: permissions);
    }


    _mgdl = 80 + Random().nextInt(130 - 90);
    bool success = await health.writeHealthData(
        _nofSteps * 1.0, HealthDataType.STEPS, earlier, now);

    if (success) {
      success = await health.writeHealthData(
          _mgdl * 1.0, HealthDataType.HEART_RATE, now, now);
    }
    h1 =
        Healthdata(exerciseSet: exericeid, type: 1, value: _mgdl, training: exericeid);
    httppostHealthdata("", {}, h1);
    channel.sink.add(json.encode({"device": "watch", "healthdata": h1.toJson()}));

    setState(() {
      _state = success ? AppState.DATA_ADDED : AppState.DATA_NOT_ADDED;
    });
    sleep(Duration(seconds: 2));
  }

  /// Fetch steps from the health plugin and show them in the app.
  Future fetchStepData() async {
    int? steps;

    // get steps for today (i.e., since midnight)
    final now = DateTime.now();
    final midnight = DateTime(now.year, now.month, now.day);

    bool requested = await health.requestAuthorization([HealthDataType.STEPS]);

    if (requested) {
      try {
        steps = await health.getTotalStepsInInterval(midnight, now);
      } catch (error) {
        print("Caught exception in getTotalStepsInInterval: $error");
      }

      print('Total number of steps: $steps');

      setState(() {
        _nofSteps = (steps == null) ? 0 : steps;
        _state = (steps == null) ? AppState.NO_DATA : AppState.STEPS_READY;
      });
    } else {
      print("Authorization not granted");
      setState(() => _state = AppState.DATA_NOT_FETCHED);
    }
  }

  Widget _contentFetchingData() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
            padding: EdgeInsets.all(20),
            child: CircularProgressIndicator(
              strokeWidth: 10,
            )),
        Text('Fetching data...')
      ],
    );
  }

  Widget _contentDataReady() {
    return ListView.builder(
        itemCount: _healthDataList.length,
        itemBuilder: (_, index) {
          HealthDataPoint p = _healthDataList[index];
          return ListTile(
            title: Text("${p.typeString}: ${p.value}"),
            trailing: Text('${p.unitString}'),
            subtitle: Text('${p.dateFrom} - ${p.dateTo}'),
          );
        });
  }

  Widget _contentNoData() {
    return Text('No Data to show');
  }

  Widget _contentNotFetched() {
    return Column(
      children: [
        Text('Press the download button to fetch data.'),
        Text('Press the plus button to insert some random data.'),
        Text('Press the walking button to get total step count.'),
      ],
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }

  Widget _authorizationNotGranted() {
    return Text('Authorization not given. '
        'For Android please check your OAUTH2 client ID is correct in Google Developer Console. '
        'For iOS check your permissions in Apple Health.');
  }

  Widget _dataAdded() {
    return Text('$_nofSteps steps and $_mgdl mgdl are inserted successfully!');
  }

  Widget _stepsFetched() {
    return Text('Total number of steps: $_nofSteps');
  }

  Widget _dataNotAdded() {
    return Text('Failed to add data');
  }

  Widget _content() {
    if (_state == AppState.DATA_READY)
      return _contentDataReady();
    else if (_state == AppState.NO_DATA)
      return _contentNoData();
    else if (_state == AppState.FETCHING_DATA)
      return _contentFetchingData();
    else if (_state == AppState.AUTH_NOT_GRANTED)
      return _authorizationNotGranted();
    else if (_state == AppState.DATA_ADDED)
      return _dataAdded();
    else if (_state == AppState.STEPS_READY)
      return _stepsFetched();
    else if (_state == AppState.DATA_NOT_ADDED) return _dataNotAdded();

    return _contentNotFetched();
  }

  Healthdata h1 =
        Healthdata(exerciseSet: 1, type: 1, value: 0, training: 1);
  int exericeid = 1;
  @override
  void initState() {
    super.initState();
    channel.stream.listen((message) {
      print(message);
      var jd = json.decode(message);
      if (jd["device"] == "phone") {
        if(jd["command"] != "data"){
          
        }
        if (jd["command"] == "exercisesT") {
          exercises = true;
          addData();
          exericeid = jd["exerciseid"];
        } else if (jd["command"] == "exercisesF") {
          exercises = false;
          addData();
        }
        if (jd["command"] == "stopedT") {
          stoped = true;
          addData();
        } else if (jd["command"] == "stopedF") {
          stoped = false;
          addData();
        }
        if (jd["command"] == "timerstartedT") {
          timerstarted = true;
          addData();
        } else if (jd["command"] == "timerstartedF") {
          timerstarted = false;
        }
      }
    });
    _controller = TextEditingController();
  }

  void dispose() {
    _controller.dispose();

    timer?.cancel();
    super.dispose();
  }

  Timer? timer;
  bool switchedon = false;
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: const MediaQueryData(size: Size(320.0, 320.0)),
      child: MaterialApp(
        home: Scaffold(
            key: ValueKey<bool>(exercises),
            body: Padding(
              padding: const EdgeInsets.all(10),
              child: exercises
                  ? Column(
                      key: ValueKey<bool>(timerstarted),
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            !stoped
                                ? ShadowButton(
                                    buttonColor: Colors.orange[400]!,
                                    iconsymbol: const Icon(
                                      Icons.pause,
                                      color: Colors.white,
                                      size: 30.0,
                                    ),
                                    buttonText: "pause",
                                    width: 80,
                                    hight: 50,
                                    Tapactivation: () => {
                                          channel.sink.add(json.encode({
                                            "device": "watch",
                                            "command": "pause"
                                          })),
                                          stoped = true,
                                          if (timerstarted)
                                            {
                                              timer?.cancel()
                                            },
                                            addData()
                                        })
                                : ShadowButton(
                                    buttonColor: Colors.orange[400]!,
                                    iconsymbol: const Icon(
                                      Icons.play_arrow,
                                      color: Colors.white,
                                      size: 30.0,
                                    ),
                                    buttonText: "pause",
                                    width: 80,
                                    hight: 50,
                                    Tapactivation: () => {
                                          channel.sink.add(json.encode({
                                            "device": "watch",
                                            "command": "start"
                                          })),
                                          stoped = false,
                                          addData(),
                                          if (!timerstarted)
                                            {
                                              timerstarted = true,
                                              timer = Timer.periodic(
                                                  Duration(seconds: 10),
                                                  (Timer t) => addData())
                                            }
                                        }),
                            ShadowButton(
                                buttonColor: Colors.red[400]!,
                                iconsymbol: const Icon(
                                  Icons.stop,
                                  color: Colors.white,
                                  size: 30.0,
                                ),
                                width: 80,
                                hight: 50,
                                Tapactivation: () => {
                                      channel.sink.add(json.encode({
                                        "device": "watch",
                                        "command": "stop"
                                      })),
                                      if (timerstarted)
                                        {timerstarted = false, timer?.cancel()},
                                      exercises = false,
                                      stoped = false,
                                      timerstarted = false,
                                      addData(),
                                    })
                          ],
                        ),
                        if (!timerstarted)
                          Center(
                            child: ShadowButton(
                                key: ValueKey<bool>(timerstarted),
                                buttonColor: Colors.green[400]!,
                                buttonText: "start",
                                width: 160,
                                hight: 50,
                                Tapactivation: () => {
                                      channel.sink.add(json.encode({
                                        "device": "watch",
                                        "command": "start"
                                      })),
                                      timerstarted = true,
                                      addData(),
                                      if (!timerstarted)
                                        {
                                          timerstarted = true,
                                          timer = Timer.periodic(
                                              Duration(seconds: 10),
                                              (Timer t) => addData())
                                        }
                                    }),
                          ),
                      ],
                    )
                  : Center(
                      child: Text(
                        "Select a Workout",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: 'Lexend Deca',
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
            )),
      ),
    );
  }
}

/*// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';
import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/fitness/v1.dart';
import 'package:googleapis_auth/googleapis_auth.dart' as auth show AuthClient;

final GoogleSignIn _googleSignIn = GoogleSignIn(
  // Optional clientId
  // clientId: '[YOUR_OAUTH_2_CLIENT_ID]',
  //clientId:'982191198573-ssmhfbuuc6cg5go81941151ead12d3ud.apps.googleusercontent.com',
  //scopes: <String>[PeopleServiceApi.contactsReadonlyScope],
  scopes: <String>[
    FitnessApi.fitnessActivityReadScope,
    FitnessApi.fitnessActivityWriteScope,
    FitnessApi.fitnessBloodGlucoseReadScope,
    FitnessApi.fitnessBloodGlucoseWriteScope,
    FitnessApi.fitnessBloodPressureReadScope,
    FitnessApi.fitnessBloodPressureWriteScope,
    FitnessApi.fitnessBodyReadScope,
    FitnessApi.fitnessBodyTemperatureReadScope,
    FitnessApi.fitnessBodyTemperatureWriteScope,
    FitnessApi.fitnessBodyWriteScope,
    FitnessApi.fitnessHeartRateReadScope,
    FitnessApi.fitnessHeartRateWriteScope,
    FitnessApi.fitnessLocationReadScope,
    FitnessApi.fitnessLocationWriteScope,
    FitnessApi.fitnessNutritionReadScope,
    FitnessApi.fitnessNutritionWriteScope,
    FitnessApi.fitnessOxygenSaturationReadScope,
    FitnessApi.fitnessOxygenSaturationWriteScope,
    FitnessApi.fitnessReproductiveHealthReadScope,
    FitnessApi.fitnessReproductiveHealthWriteScope,
    FitnessApi.fitnessSleepReadScope,
    FitnessApi.fitnessSleepWriteScope
  ],
);

void main() {
  runApp(
    const MaterialApp(
      title: 'Google Sign In',
      home: SignInDemo(),
    ),
  );
}

/// The main widget of this demo.
class SignInDemo extends StatefulWidget {
  /// Creates the main widget of this demo.
  const SignInDemo({Key? key}) : super(key: key);

  @override
  State createState() => SignInDemoState();
}

/// The state of the main widget.
class SignInDemoState extends State<SignInDemo> {
  GoogleSignInAccount? _currentUser;
  String _contactText = '';

  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      setState(() {
        _currentUser = account;
      });
      if (_currentUser != null) {
        _handleGetContact();
      }
    });
    _googleSignIn.signInSilently();
  }

  Future<void> _handleGetContact() async {
    setState(() {
      _contactText = 'Loading contact info...';
    });

    // Retrieve an [auth.AuthClient] from the current [GoogleSignIn] instance.
    final auth.AuthClient? client = await _googleSignIn.authenticatedClient();

    assert(client != null, 'Authenticated client missing!');

    // Prepare a People Service authenticated client.
    //final PeopleServiceApi peopleApi = PeopleServiceApi(client!);

    final FitnessApi fitnessApi = FitnessApi(client!);
    // Retrieve a list of the `names` of my `connections`
    /*final ListConnectionsResponse responsep =
        await peopleApi.people.connections.list(
      'people/me',
      personFields: 'names',
    );*/
    fitnessApi.users.sessions;
    final UsersResource response =
        await fitnessApi.users;
    
    final String? firstNamedContactName =
        _pickFirstNamedContactF(response);

    setState(() {
      if (firstNamedContactName != null) {
        _contactText = 'I see you know $firstNamedContactName!';
      } else {
        _contactText = 'No contacts to display.';
      }
    });
  }

  String? _pickFirstNamedContactF(UsersResource? connections) {
    Session session;
    session = new Session()
    for ()
  }

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  Future<void> _handleSignOut() => _googleSignIn.disconnect();

  Widget _buildBody() {
    final GoogleSignInAccount? user = _currentUser;
    if (user != null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ListTile(
            leading: GoogleUserCircleAvatar(
              identity: user,
            ),
            title: Text(user.displayName ?? ''),
            subtitle: Text(user.email),
          ),
          const Text('Signed in successfully.'),
          Text(_contactText),
          ElevatedButton(
            child: const Text('SIGN OUT'),
            onPressed: _handleSignOut,
          ),
          ElevatedButton(
            child: const Text('REFRESH'),
            onPressed: _handleGetContact,
          ),
        ],
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          const Text('You are not currently signed in.'),
          ElevatedButton(
            child: const Text('SIGN IN'),
            onPressed: _handleSignIn,
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Google Sign In'),
        ),
        body: ConstrainedBox(
          constraints: const BoxConstraints.expand(),
          child: _buildBody(),
        ));
  }
}
*/
/*import 'package:flutter/material.dart';
//import 'package:wearable_communicator/wearable_communicator.dart';
import 'package:googleapis/fitness/v1.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart';

// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'dart:async';
import 'dart:convert' show json;

import "package:http/http.dart" as http;
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  // Optional clientId
  //            982191198573-ssmhfbuuc6cg5go81941151ead12d3ud.apps.googleusercontent.com
  // clientId: '479882132969-9i9aqik3jfjd7qhci1nqf0bm2g71rm1u.apps.googleusercontent.com',
  signInOption: SignInOption.standard,
  clientId:
      '982191198573-ssmhfbuuc6cg5go81941151ead12d3ud.apps.googleusercontent.com',
  scopes: <String>[
    'stevelp91@gmail.com',
    'https://www.googleapis.com/auth/userinfo.profile',
  ],
);

void main() {
  runApp(
    MaterialApp(
      title: 'Google Sign In',
      home: SignInDemo(),
    ),
  );
}

class SignInDemo extends StatefulWidget {
  @override
  State createState() => SignInDemoState();
}

class SignInDemoState extends State<SignInDemo> {
  GoogleSignInAccount? _currentUser;
  String _contactText = '';

  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      setState(() {
        _currentUser = account;
      });
      if (_currentUser != null) {
        _handleGetContact(_currentUser!);
      }
    });
    _googleSignIn.signInSilently();
  }

  Future<void> _handleGetContact(GoogleSignInAccount user) async {
    setState(() {
      _contactText = "Loading contact info...";
    });
    final http.Response response = await http.get(
      Uri.parse('https://people.googleapis.com/v1/people/me/connections'
          '?requestMask.includeField=person.names'),
      headers: await user.authHeaders,
    );
    if (response.statusCode != 200) {
      setState(() {
        _contactText = "People API gave a ${response.statusCode} "
            "response. Check logs for details.";
      });
      print('People API ${response.statusCode} response: ${response.body}');
      return;
    }
    final Map<String, dynamic> data = json.decode(response.body);
    final String? namedContact = _pickFirstNamedContact(data);
    setState(() {
      if (namedContact != null) {
        _contactText = "I see you know $namedContact!";
      } else {
        _contactText = "No contacts to display.";
      }
    });
  }

  String? _pickFirstNamedContact(Map<String, dynamic> data) {
    final List<dynamic>? connections = data['connections'];
    final Map<String, dynamic>? contact = connections?.firstWhere(
      (dynamic contact) => contact['names'] != null,
      orElse: () => null,
    );
    if (contact != null) {
      final Map<String, dynamic>? name = contact['names'].firstWhere(
        (dynamic name) => name['displayName'] != null,
        orElse: () => null,
      );
      if (name != null) {
        return name['displayName'];
      }
    }
    return null;
  }

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  Future<void> _handleSignOut() => _googleSignIn.disconnect();

  Widget _buildBody() {
    GoogleSignInAccount? user = _currentUser;
    if (user != null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ListTile(
            leading: GoogleUserCircleAvatar(
              identity: user,
            ),
            title: Text(user.displayName ?? ''),
            subtitle: Text(user.email),
          ),
          const Text("Signed in successfully."),
          Text(_contactText),
          ElevatedButton(
            child: const Text('SIGN OUT'),
            onPressed: _handleSignOut,
          ),
          ElevatedButton(
            child: const Text('REFRESH'),
            onPressed: () => _handleGetContact(user),
          ),
        ],
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          const Text("You are not currently signed in."),
          ElevatedButton(
            child: const Text('SIGN IN'),
            onPressed: () => _handleSignIn(),
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Google Sign In'),
        ),
        body: ConstrainedBox(
          constraints: const BoxConstraints.expand(),
          child: _buildBody(),
        ));
  }
}
*/


/*
class _MyAppState extends State<MyApp> {
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                    border: InputBorder.none, labelText: 'Enter some text'),
                onChanged: (String val) async {
                  setState(() {
                    value = val;
                  });
                },
              ),
              RaisedButton(
                child: Text('Send message to wearable'),
                onPressed: () {
                  primaryFocus!.unfocus(disposition: UnfocusDisposition.scope);
                  
                },
              ),
              RaisedButton(
                child: Text('set data on wearable'),
                onPressed: () {
                  primaryFocus!.unfocus(disposition: UnfocusDisposition.scope);
                  WearableCommunicator.setData("message", {
                    "text": value != ""
                        ? value
                        : "test", // ensure we have at least empty string
                    "integerValue": 1,
                    "intList": [1, 2, 3],
                    "stringList": ["one", "two", "three"],
                    "floatList": [1.0, 2.4, 3.6],
                    "longList": []
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}*/
/*import 'package:wear/wear.dart';
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
//import 'package:wear/wear.dart';
import 'package:wearos_client/http.dart';
import 'http.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: TextButton(
          onPressed: () => {
            httpget("users/1/workoutPlans", {}),
          },
          child: const Text(
            'http',
          ),
        )),
      ),
    );
  }
}
*/*///