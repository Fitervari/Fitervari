import 'dart:convert';

import 'country.dart';

class City {
  final String city;
  final Country country;
  final int id;
  final String postalCode;
  City({
    required this.city,
    required this.country,
    required this.id,
    required this.postalCode,
  });

  City copyWith({
    String? city,
    Country? country,
    int? id,
    String? postalCode,
  }) {
    return City(
      city: city ?? this.city,
      country: country ?? this.country,
      id: id ?? this.id,
      postalCode: postalCode ?? this.postalCode,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'city': city,
      'country': country.toMap(),
      'id': id,
      'postalCode': postalCode,
    };
  }

  factory City.fromMap(Map<String, dynamic> map) {
    return City(
      city: map['city'] ?? '',
      country: Country.fromMap(map['country']),
      id: map['id']?.toInt() ?? 0,
      postalCode: map['postalCode'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory City.fromJson(String source) => City.fromMap(json.decode(source));

  @override
  String toString() {
    return 'City(city: $city, country: $country, id: $id, postalCode: $postalCode)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is City &&
      other.city == city &&
      other.country == country &&
      other.id == id &&
      other.postalCode == postalCode;
  }

  @override
  int get hashCode {
    return city.hashCode ^
      country.hashCode ^
      id.hashCode ^
      postalCode.hashCode;
  }
}