import 'dart:convert';

import 'exercise_set.dart';

class Healthdata {
  final ExerciseSet exerciseSet;
  final int id;
  final String time;
  final String type;
  final double value;
  Healthdata({
    required this.exerciseSet,
    required this.id,
    required this.time,
    required this.type,
    required this.value,
  });

  Healthdata copyWith({
    ExerciseSet? exerciseSet,
    int? id,
    String? time,
    String? type,
    double? value,
  }) {
    return Healthdata(
      exerciseSet: exerciseSet ?? this.exerciseSet,
      id: id ?? this.id,
      time: time ?? this.time,
      type: type ?? this.type,
      value: value ?? this.value,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'exerciseSet': exerciseSet.toMap(),
      'id': id,
      'time': time,
      'type': type,
      'value': value,
    };
  }

  factory Healthdata.fromMap(Map<String, dynamic> map) {
    return Healthdata(
      exerciseSet: ExerciseSet.fromMap(map['exerciseSet']),
      id: map['id']?.toInt() ?? 0,
      time: map['time'] ?? '',
      type: map['type'] ?? '',
      value: map['value'] ?? '',
    );
  }
  factory Healthdata.fromList(var map) {
    return Healthdata(
      exerciseSet: ExerciseSet.fromMap(map['exerciseSet']),
      id: map['id']?.toInt() ?? 0,
      time: map['time'] ?? '',
      type: map['type'] ?? '',
      value: map['value'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Healthdata.fromJson(String source) =>
      Healthdata.fromMap(json.decode(source));
  factory Healthdata.fromJsonListElement(var source) =>
      Healthdata.fromList(source);
  @override
  String toString() {
    return 'Healthdata(exerciseSet: $exerciseSet, id: $id, time: $time, type: $type, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Healthdata &&
        other.exerciseSet == exerciseSet &&
        other.id == id &&
        other.time == time &&
        other.type == type &&
        other.value == value;
  }

  @override
  int get hashCode {
    return exerciseSet.hashCode ^
        id.hashCode ^
        time.hashCode ^
        type.hashCode ^
        value.hashCode;
  }
}
