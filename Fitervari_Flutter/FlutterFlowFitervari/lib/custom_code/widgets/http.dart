import 'dart:convert' as convert;
import 'dart:async';
import 'dart:convert';
import 'package:fitervari_flutter/data/data.dart';
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
    print(workoutplans[0].exercises[0].exerciseSets);
    return workoutplans;
  }
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
  throw Error();
}

Future<Map<String, dynamic>> httpget(
    String? urlstr, Map<String, String> specialheaders) async {
  Uri url = Uri.parse('$baseurl/$urlstr');
  Map<String, String> headermap = {"Content-Type": "application/json"};
  if (specialheaders.isNotEmpty) {
    headermap.addAll(specialheaders);
  }
  http.Response response = await http.get(url, headers: headermap);
  if (response.statusCode == 200) {
    Map<String, dynamic> data = convert.jsonDecode(response.body);
    print(data);
    return data;
  }
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
  throw Error();
}

void httppost(
    String? urlstr, Map<String, String> specialheaders, Map data) async {
  Uri url = Uri.parse('$baseurl/$urlstr');
  Map<String, String> headermap = {"Content-Type": "application/json"};
  if (specialheaders.isNotEmpty) {
    headermap.addAll(specialheaders);
  }
  var body = convert.jsonEncode(data);
  http.Response response = await http.post(url, headers: headermap, body: body);
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
}

void httpput(
    String? urlstr, Map<String, String> specialheaders, Map data) async {
  Uri url = Uri.parse('$baseurl/$urlstr');
  Map<String, String> headermap = {"Content-Type": "application/json"};
  if (specialheaders.isNotEmpty) {
    headermap.addAll(specialheaders);
  }
  var body = convert.jsonEncode(data);
  http.Response response = await http.put(url, headers: headermap, body: body);
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
}

void httpdelete(
    String? urlstr, Map<String, String> specialheaders, Map data) async {
  Uri url = Uri.parse('$baseurl/$urlstr');
  Map<String, String> headermap = {"Content-Type": "application/json"};
  if (specialheaders.isNotEmpty) {
    headermap.addAll(specialheaders);
  }
  var body = convert.jsonEncode(data);
  http.Response response =
      await http.delete(url, headers: headermap, body: body);
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
}
