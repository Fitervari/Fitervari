import 'dart:convert';

class ExerciseSet {
  final String description;
  final int id;
  final String repetitions;
  ExerciseSet({
    required this.description,
    required this.id,
    required this.repetitions,
  });

  ExerciseSet copyWith({
    String? description,
    int? id,
    String? repetitions,
  }) {
    return ExerciseSet(
      description: description ?? this.description,
      id: id ?? this.id,
      repetitions: repetitions ?? this.repetitions,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'description': description,
      'id': id,
      'repetitions': repetitions,
    };
  }

  factory ExerciseSet.fromMap(Map<String, dynamic> map) {
    return ExerciseSet(
      description: map['description'] ?? '',
      id: map['id']?.toInt() ?? 0,
      repetitions: map['repetitions'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ExerciseSet.fromJson(String source) => ExerciseSet.fromMap(json.decode(source));

  @override
  String toString() => 'ExerciseSet(description: $description, id: $id, repetitions: $repetitions)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ExerciseSet &&
      other.description == description &&
      other.id == id &&
      other.repetitions == repetitions;
  }

  @override
  int get hashCode => description.hashCode ^ id.hashCode ^ repetitions.hashCode;
}