import 'dart:convert';

import 'package:collection/collection.dart';

import 'exercise.dart';

class Workoutplan {
  final bool archived;
  final List<Exercise> exercises;
  final int id;
  final String name;
  final String validFrom;
  Workoutplan({
    required this.archived,
    required this.exercises,
    required this.id,
    required this.name,
    required this.validFrom,
  });

  Workoutplan copyWith({
    bool? archived,
    List<Exercise>? exercises,
    int? id,
    String? name,
    String? validFrom,
  }) {
    return Workoutplan(
      archived: archived ?? this.archived,
      exercises: exercises ?? this.exercises,
      id: id ?? this.id,
      name: name ?? this.name,
      validFrom: validFrom ?? this.validFrom,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'archived': archived,
      'exercises': exercises.map((x) => x.toMap()).toList(),
      'id': id,
      'name': name,
      'validFrom': validFrom,
    };
  }

  factory Workoutplan.fromMap(Map<String, dynamic> map) {
    return Workoutplan(
      archived: map['archived'] ?? false,
      exercises: List<Exercise>.from(
          map['exercises']?.map((x) => Exercise.fromMap(x))),
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      validFrom: map['validFrom'] ?? '',
    );
  }
  factory Workoutplan.fromList(var map) {
    return Workoutplan(
      archived: map['archived'] ?? false,
      exercises: List<Exercise>.from(
          map['exercises']?.map((x) => Exercise.fromMap(x))),
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      validFrom: map['validFrom'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Workoutplan.fromJson(String source) =>
      Workoutplan.fromMap(json.decode(source));
  factory Workoutplan.fromJsonListElement(var source) =>
      Workoutplan.fromList(source);
  @override
  String toString() {
    return 'Workoutplan(archived: $archived, exercises: $exercises, id: $id, name: $name, validFrom: $validFrom)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is Workoutplan &&
        other.archived == archived &&
        listEquals(other.exercises, exercises) &&
        other.id == id &&
        other.name == name &&
        other.validFrom == validFrom;
  }

  @override
  int get hashCode {
    return archived.hashCode ^
        exercises.hashCode ^
        id.hashCode ^
        name.hashCode ^
        validFrom.hashCode;
  }
}
