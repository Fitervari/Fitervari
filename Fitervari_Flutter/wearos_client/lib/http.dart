import 'dart:convert' as convert;
import 'dart:async';
import 'dart:convert';

void
    main() async {} /*
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

void sendHealthData(var healthval, double healthdata) async {
  Uri url = Uri.parse(
      'https://student.cloud.htl-leonding.ac.at/m.rausch-schott/fitervari/api/healthdata');
  Map data = {"id": healthval, "value": healthdata};
  counter++;
  //encode Map to JSON
  var body = json.encode(data);
  http.Response response = await http.put(url,
      headers: {"Content-Type": "application/json"}, body: body);
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
}

var counter = 0;
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