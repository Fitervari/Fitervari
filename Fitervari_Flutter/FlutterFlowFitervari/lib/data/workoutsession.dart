import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'healthdata.dart';

class WorkoutSession {
  final String date;
  DateTime endTime;
  //final List<Healthdata> healthData;
  final int id;
  final DateTime startTime;
  WorkoutSession({
    required this.date,
    required this.endTime,
    //required this.healthData,
    required this.id,
    required this.startTime,
  });

  WorkoutSession copyWith({
    String? date,
    DateTime? endTime,
    //List<Healthdata>? healthData,
    int? id,
    DateTime? startTime,
  }) {
    return WorkoutSession(
      date: date ?? this.date,
      endTime: endTime ?? this.endTime,
     // healthData: healthData ?? this.healthData,
      id: id ?? this.id,
      startTime: startTime ?? this.startTime,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'date': date,
     // 'endTime': endTime,
     // 'healthData': healthData.map((x) => x.toMap()).toList(),
     // 'id': id,
      'startTime': startTime,
    };
  }
  Map<String, dynamic> toUpdatedMap() {
    return {
      'date': date,
      'endTime': endTime,
     // 'healthData': healthData.map((x) => x.toMap()).toList(),
      'id': id,
      'startTime': startTime,
    };
  }

  factory WorkoutSession.fromMap(Map<String, dynamic> map) {
    return WorkoutSession(
      date: map['date'] ?? '',
      endTime: map['endTime'] ?? '',
      //healthData: List<Healthdata>.from(map['healthData']?.map((x) => Healthdata.fromMap(x))),
      id: map['id']?.toInt() ?? 0,
      startTime: map['startTime'] ?? '',
    );
  }
  factory WorkoutSession.fromList(var map) {
    return WorkoutSession(
      date: map['date'] ?? '',
      endTime: map['endTime'] ?? '',
      //healthData: List<Healthdata>.from(map['healthData']?.map((x) => Healthdata.fromMap(x))),
      id: map['id']?.toInt() ?? 0,
      startTime: map['startTime'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());
  String toJsonUpdate() => json.encode(toUpdatedMap());    
  factory WorkoutSession.fromJson(String source) => WorkoutSession.fromMap(json.decode(source));
factory WorkoutSession.fromJsonListElement(var source) =>
      WorkoutSession.fromList(source);
  @override
  String toString() {
    return 'WorkoutSession(date: $date, endTime: $endTime, id: $id, startTime: $startTime)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is WorkoutSession &&
      other.date == date &&
      other.endTime == endTime &&
     // listEquals(other.healthData, healthData) &&
      other.id == id &&
      other.startTime == startTime;
  }

  @override
  int get hashCode {
    return date.hashCode ^
      endTime.hashCode ^
      //healthData.hashCode ^
      id.hashCode ^
      startTime.hashCode;
  }
}