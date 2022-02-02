import 'dart:convert';

import 'exercise_set.dart';

class Healthdata {
  final int exerciseSet;
  final int training;
  final int type;
  final String value;
  Healthdata({
    required this.exerciseSet,
    required this.training,
    required this.type,
    required this.value,
  });

  Healthdata copyWith({
    int? exerciseSet,
    int? training,
    int? type,
    String? value,
  }) {
    return Healthdata(
      exerciseSet: exerciseSet ?? this.exerciseSet,
      training: training ?? this.training,
      type: type ?? this.type,
      value: value ?? this.value,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'exerciseSet': exerciseSet,
      'training': training,
      'type': type,
      'value': value,
    };
  }

  factory Healthdata.fromMap(Map<String, dynamic> map) {
    return Healthdata(
      exerciseSet: map['exerciseSet'] ?? '',
      training: map['training'] ?? '',
      type: map['type'] ?? '',
      value: map['value'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Healthdata.fromJson(String source) =>
      Healthdata.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Healthdata(exerciseSet: $exerciseSet, time: $training, type: $type, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Healthdata &&
        other.exerciseSet == exerciseSet &&
        other.training == training &&
        other.type == type &&
        other.value == value;
  }

  @override
  int get hashCode {
    return exerciseSet.hashCode ^
        training.hashCode ^
        type.hashCode ^
        value.hashCode;
  }
}
