import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'activation_code.dart';
import 'city.dart';
import 'studio.dart';

class User {
  final List<ActivationCode> activationCodes;
  final String address;
  final String birthDate;
  final City city;
  final String email;
  final String firstName;
  final int id;
  final String lastName;
  final Studio studio;
  User({
    required this.activationCodes,
    required this.address,
    required this.birthDate,
    required this.city,
    required this.email,
    required this.firstName,
    required this.id,
    required this.lastName,
    required this.studio,
  });

  User copyWith({
    List<ActivationCode>? activationCodes,
    String? address,
    String? birthDate,
    City? city,
    String? email,
    String? firstName,
    int? id,
    String? lastName,
    Studio? studio,
  }) {
    return User(
      activationCodes: activationCodes ?? this.activationCodes,
      address: address ?? this.address,
      birthDate: birthDate ?? this.birthDate,
      city: city ?? this.city,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      id: id ?? this.id,
      lastName: lastName ?? this.lastName,
      studio: studio ?? this.studio,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'activationCodes': activationCodes.map((x) => x.toMap()).toList(),
      'address': address,
      'birthDate': birthDate,
      'city': city.toMap(),
      'email': email,
      'firstName': firstName,
      'id': id,
      'lastName': lastName,
      'studio': studio.toMap(),
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      activationCodes: List<ActivationCode>.from(
          map['activationCodes']?.map((x) => ActivationCode.fromMap(x))),
      address: map['address'] ?? '',
      birthDate: map['birthDate'] ?? '',
      city: City.fromMap(map['city']),
      email: map['email'] ?? '',
      firstName: map['firstName'] ?? '',
      id: map['id']?.toInt() ?? 0,
      lastName: map['lastName'] ?? '',
      studio: Studio.fromMap(map['studio']),
    );
  }
  factory User.fromList(var map) {
    return User(
      activationCodes: List<ActivationCode>.from(
          map['activationCodes']?.map((x) => ActivationCode.fromMap(x))),
      address: map['address'] ?? '',
      birthDate: map['birthDate'] ?? '',
      city: City.fromMap(map['city']),
      email: map['email'] ?? '',
      firstName: map['firstName'] ?? '',
      id: map['id']?.toInt() ?? 0,
      lastName: map['lastName'] ?? '',
      studio: Studio.fromMap(map['studio']),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
  factory User.fromJsonListElement(var source) => User.fromList(source);
  @override
  String toString() {
    return 'User(activationCodes: $activationCodes, address: $address, birthDate: $birthDate, city: $city, email: $email, firstName: $firstName, id: $id, lastName: $lastName, studio: $studio)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        listEquals(other.activationCodes, activationCodes) &&
        other.address == address &&
        other.birthDate == birthDate &&
        other.city == city &&
        other.email == email &&
        other.firstName == firstName &&
        other.id == id &&
        other.lastName == lastName &&
        other.studio == studio;
  }

  @override
  int get hashCode {
    return activationCodes.hashCode ^
        address.hashCode ^
        birthDate.hashCode ^
        city.hashCode ^
        email.hashCode ^
        firstName.hashCode ^
        id.hashCode ^
        lastName.hashCode ^
        studio.hashCode;
  }
}
