import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';

bool checkUserID() {
  return true;
}

String convertToHumanReadableDate(DateTime timestampDate) {
  // converts dateTime to readable date returns string
  var converter = new DateFormat('MMMM d, y');
  String finalDate = converter.format(timestampDate);
  return finalDate;
}

bool checkConditions2(
  bool condition1,
  bool condition2,
) {
  // return true if both conditions are true else false
  return condition1 && condition2;
}

bool checkconditions3(
  bool condition1,
  bool condition2,
  bool condition3,
) {
  // return true if all conditions are true else false
  return condition1 && condition2 && condition3;
}
