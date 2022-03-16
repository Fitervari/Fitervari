import 'dart:convert';

import 'package:collection/collection.dart';

import 'exercise_set.dart';

class Exercise {
  final String description;
  final List<ExerciseSet> exerciseSets;
  final int id;
  final String name;
  Exercise({
    required this.description,
    required this.exerciseSets,
    required this.id,
    required this.name,
  });

  Exercise copyWith({
    String? description,
    List<ExerciseSet>? exerciseSets,
    int? id,
    String? name,
  }) {
    return Exercise(
      description: description ?? this.description,
      exerciseSets: exerciseSets ?? this.exerciseSets,
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'description': description,
      'exerciseSets': exerciseSets.map((x) => x.toMap()).toList(),
      'id': id,
      'name': name,
    };
  }

  factory Exercise.fromMap(Map<String, dynamic> map) {
    return Exercise(
      description: map['description'] ?? '',
      exerciseSets: List<ExerciseSet>.from(map['exerciseSets']?.map((x) => ExerciseSet.fromMap(x))),
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Exercise.fromJson(String source) => Exercise.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Exercise(description: $description, exerciseSets: $exerciseSets, id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;
  
    return other is Exercise &&
      other.description == description &&
      listEquals(other.exerciseSets, exerciseSets) &&
      other.id == id &&
      other.name == name;
  }

  @override
  int get hashCode {
    return description.hashCode ^
      exerciseSets.hashCode ^
      id.hashCode ^
      name.hashCode;
  }
}