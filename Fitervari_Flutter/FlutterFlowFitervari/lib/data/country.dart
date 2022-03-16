import 'dart:convert';

class Country {
  final String code;
  final int id;
  final String name;
  Country({
    required this.code,
    required this.id,
    required this.name,
  });

  Country copyWith({
    String? code,
    int? id,
    String? name,
  }) {
    return Country(
      code: code ?? this.code,
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'id': id,
      'name': name,
    };
  }

  factory Country.fromMap(Map<String, dynamic> map) {
    return Country(
      code: map['code'] ?? '',
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Country.fromJson(String source) => Country.fromMap(json.decode(source));

  @override
  String toString() => 'Country(code: $code, id: $id, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Country &&
      other.code == code &&
      other.id == id &&
      other.name == name;
  }

  @override
  int get hashCode => code.hashCode ^ id.hashCode ^ name.hashCode;
}