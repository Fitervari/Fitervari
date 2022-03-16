import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'city.dart';
import 'device_group.dart';

class Studio {
  final String address;
  final City city;
  final List<DeviceGroup> deviceGroups;
  final int id;
  final String name;
  Studio({
    required this.address,
    required this.city,
    required this.deviceGroups,
    required this.id,
    required this.name,
  });

  Studio copyWith({
    String? address,
    City? city,
    List<DeviceGroup>? deviceGroups,
    int? id,
    String? name,
  }) {
    return Studio(
      address: address ?? this.address,
      city: city ?? this.city,
      deviceGroups: deviceGroups ?? this.deviceGroups,
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'address': address,
      'city': city.toMap(),
      'deviceGroups': deviceGroups.map((x) => x.toMap()).toList(),
      'id': id,
      'name': name,
    };
  }

  factory Studio.fromMap(Map<String, dynamic> map) {
    return Studio(
      address: map['address'] ?? '',
      city: City.fromMap(map['city']),
      deviceGroups: List<DeviceGroup>.from(map['deviceGroups']?.map((x) => DeviceGroup.fromMap(x))),
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Studio.fromJson(String source) => Studio.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Studio(address: $address, city: $city, deviceGroups: $deviceGroups, id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Studio &&
      other.address == address &&
      other.city == city &&
      listEquals(other.deviceGroups, deviceGroups) &&
      other.id == id &&
      other.name == name;
  }

  @override
  int get hashCode {
    return address.hashCode ^
      city.hashCode ^
      deviceGroups.hashCode ^
      id.hashCode ^
      name.hashCode;
  }
}