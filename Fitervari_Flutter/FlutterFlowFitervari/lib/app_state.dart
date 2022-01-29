import 'package:fitervari_flutter/custom_code/widgets/http.dart';
import 'package:fitervari_flutter/data/workoutplan.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }
  late final SharedPreferences prefs;
  Future initializePersistedState() async {
    /*Map<String, dynamic> jsUser = await httpget("users/1", Map());
    _firstname = jsUser["firstname"];
    _lastname = jsUser["lastname"];
    _email = jsUser["email"];
    _userid = jsUser["id"];*/
    prefs = await SharedPreferences.getInstance();
    _firstname = prefs.getString('ff_firstname') ?? _firstname;
    _lastname = prefs.getString('ff_lastname') ?? _lastname;
    _email = prefs.getString('ff_email') ?? _email;
    _userid = prefs.getString('ff_userid') ?? _userid;
    _workoutToDo = prefs.getInt('ff_workoutToDo') ?? _workoutToDo;
    _systemColor = prefs.getInt('ff_systemColor') ?? _systemColor;
  }

  static setInt(strKey, strValue) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(strKey, strValue);
  }

  int NavBarPage = 1;

  String _firstname = '';
  String get firstname => _firstname;
  set firstname(String _value) {
    _firstname = _value;
    prefs.setString('ff_firstname', _value);
  }

  String _lastname = '';
  String get lastname => _lastname;
  set lastname(String _value) {
    _lastname = _value;
    prefs.setString('ff_lastname', _value);
  }

  String _email = '';
  String get email => _email;
  set email(String _value) {
    _email = _value;
    prefs.setString('ff_email', _value);
  }

  String _userid = '';
  String get userid => _userid;
  set userid(String _value) {
    _userid = _value;
    prefs.setString('ff_userid', _value);
  }

  String workoutname = '';

  int _workoutToDo = 0;
  int get workoutToDo => _workoutToDo;
  set workoutToDo(int _value) {
    _workoutToDo = _value;
    setInt('ff_workoutToDo', _value);
  }

  bool started = false;

  String selectedDay = '';

  DateTime selectedDayTime = DateTime.now();

  int _systemColor = Colors.orange.value;
  int get systemColor => _systemColor;
  set systemColor(int _value) {
    _systemColor = _value;
    setInt('ff_systemColor', _value);
  }

  //Map<dynamic, dynamic> workoutplans = getCards();
  Future<List<Workoutplan>> _workoutplans = httpgetWorkoutplans("urlstr", {});
  Future<List<Workoutplan>> get workoutplans => _workoutplans;
  Workoutplan? currentworkoutplan = null;
}

LatLng? _latLngFromString(String val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
