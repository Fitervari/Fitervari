import 'dart:convert' as convert;
import 'dart:async';
import 'dart:convert';
import 'package:health/health.dart';
import 'package:http/http.dart' as http;
import 'package:wearos_client/healthdata.dart';
import 'package:wearos_client/workoutplan.dart';

import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;

String baseurl =
    "https://student.cloud.htl-leonding.ac.at/m.rausch-schott/fitervari/api";
String baseurl1 =
    "https://student.cloud.htl-leonding.ac.at/m.rausch-schott/fitervari/api/users/1/workoutPlans";


void
    main() async {} /*


/*
void httptest() async {
  Uri url = Uri.parse(
      'https://student.cloud.htl-leonding.ac.at/m.rausch-schott/fitervari-backend-demo/demo');
  Map data = {"id": 0, "value": "cool value$counter"};
  counter++;
  //encode Map to JSON
  var body = json.encode(data);
  http.Response response = await http.put(url,
      headers: {"Content-Type": "application/json"}, body: body);
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
}*/


Future<List<Workoutplan>> httppostHealthdata(
Future<void> httppostHealthdata(
    String urlstr, Map<String, String> specialheaders, Healthdata body) async {
  Uri url = Uri.parse("$baseurl/healthdata");
  Map<String, String> headermap = {"Content-Type": "application/json"};
  if (specialheaders.isNotEmpty) {
    headermap.addAll(specialheaders);
  }
  print(body.toJson());
  http.Response response =
      await http.post(url, headers: headermap, body: body.toJson());
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
  if (response.statusCode != 201) {
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    throw Error();
  }

}

var counter = 0;
Future<List<Workoutplan>> httpget(
    String urlstr, Map<String, String> specialheaders) async {
  Uri url = Uri.parse(baseurl1);
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

/*
void httptest() async {
  var url = Uri.parse('');
  var response =
      await http.put(url, body: {"id": 0, "value": "frontend value"});
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
  print(await http.read(Uri.parse('https://example.com/foobar.txt')));
}
*/