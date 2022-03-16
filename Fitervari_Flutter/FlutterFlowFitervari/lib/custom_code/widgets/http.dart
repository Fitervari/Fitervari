import 'dart:convert' as convert;
import 'dart:async';
import 'dart:convert';
import 'package:fitervari_flutter/data/data.dart';
import 'package:fitervari_flutter/data/healthdata.dart';
import 'package:fitervari_flutter/data/user.dart';
import 'package:fitervari_flutter/data/workoutsession.dart';
import 'package:http/http.dart' as http;

String baseurl =
    "https://student.cloud.htl-leonding.ac.at/m.rausch-schott/fitervari/api";

Future<List<Workoutplan>> httpgetWorkoutplans(
    String urlstr, Map<String, String> specialheaders) async {
  Uri url = Uri.parse("$baseurl/users/1/workoutPlans");
  Map<String, String> headermap = {"Content-Type": "application/json"};
  if (specialheaders.isNotEmpty) {
    headermap.addAll(specialheaders);
  }
  http.Response response = await http.get(url, headers: headermap);
  if (response.statusCode == 200) {
    List<dynamic> data = convert.jsonDecode(response.body);
    List<Workoutplan> workoutplans = List<Workoutplan>.from([], growable: true);
    for (var plan in data) {
      workoutplans.add(Workoutplan.fromJsonListElement(plan));
    }

    return workoutplans;
  }
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
  throw Exception("httpgetWorkoutplans error");
}

Future<List<Healthdata>> httpgetHealthdata(
    String urlstr, Map<String, String> specialheaders) async {
  Uri url = Uri.parse("$baseurl/healthdata?training=1");
  Map<String, String> headermap = {"Content-Type": "application/json"};
  if (specialheaders.isNotEmpty) {
    headermap.addAll(specialheaders);
  }
  http.Response response = await http.get(url, headers: headermap);
  if (response.statusCode == 200) {
    List<dynamic> data = convert.jsonDecode(response.body);
    List<Healthdata> healthdatalist = List<Healthdata>.from([], growable: true);
    for (var healthdata in data) {
      healthdatalist.add(Healthdata.fromJsonListElement(healthdata));
    }
    return healthdatalist;
  }
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
  throw Exception("httpgetHealthdata error");
}
Future<List<WorkoutSession>> httpgetWorkoutSession(
    String urlstr, Map<String, String> specialheaders) async {
  Uri url = Uri.parse("$baseurl/workoutPlans/1/workoutSessions");
  Map<String, String> headermap = {"Content-Type": "application/json"};
  if (specialheaders.isNotEmpty) {
    headermap.addAll(specialheaders);
  }
  http.Response response = await http.get(url, headers: headermap);
  if (response.statusCode == 200) {
    List<dynamic> data = convert.jsonDecode(response.body);
    List<WorkoutSession> workoutsessionlist = List<WorkoutSession>.from([], growable: true);
    for (var workoutsession in data) {
      workoutsessionlist.add(WorkoutSession.fromJsonListElement(workoutsession));
    }
    return workoutsessionlist;
  }
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
  throw Exception("httpgetWorkoutSession error");
}
Future<List<User>> httpgetUser(
    String urlstr, Map<String, String> specialheaders) async {
  Uri url = Uri.parse("$baseurl/users/1");
  Map<String, String> headermap = {"Content-Type": "application/json"};
  if (specialheaders.isNotEmpty) {
    headermap.addAll(specialheaders);
  }
  http.Response response = await http.get(url, headers: headermap);
  if (response.statusCode == 200) {
    List<dynamic> data = convert.jsonDecode(response.body);
    List<User> users = List<User>.from([], growable: true);
    for (var user in data) {
      users.add(User.fromJsonListElement(user));
    }
    return users;
  }
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
  throw Exception("httpgetUser error");
}
Future<void> httppostWorkoutSession(
    String urlstr, Map<String, String> specialheaders, WorkoutSession body) async {
  Uri url = Uri.parse("$baseurl/workoutPlans/1/workoutSessions");
  Map<String, String> headermap = {"Content-Type": "application/json"};
  if (specialheaders.isNotEmpty) {
    headermap.addAll(specialheaders);
  }
  http.Response response =
      await http.post(url, headers: headermap, body: body.toJson());
  if (response.statusCode != 201) {
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    throw Exception("httppostWorkoutSession error");
  }
}

Future<void> httpputWorkoutSession(
    String urlstr, Map<String, String> specialheaders, WorkoutSession body) async {
  Uri url = Uri.parse("$baseurl/workoutPlans/1/workoutSessions");
  Map<String, String> headermap = {"Content-Type": "application/json"};
  if (specialheaders.isNotEmpty) {
    headermap.addAll(specialheaders);
  }
  http.Response response =
      await http.put(url, headers: headermap, body: body.toJsonUpdate());
  if (response.statusCode != 201) {
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  throw Exception("httpputWorkoutSession error");
  }
}

