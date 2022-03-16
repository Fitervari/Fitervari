import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'device.dart';

class DeviceGroup {
  final String description;
  final List<Device> devices;
  final int id;
  final String name;
  DeviceGroup({
    required this.description,
    required this.devices,
    required this.id,
    required this.name,
  });

  DeviceGroup copyWith({
    String? description,
    List<Device>? devices,
    int? id,
    String? name,
  }) {
    return DeviceGroup(
      description: description ?? this.description,
      devices: devices ?? this.devices,
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'description': description,
      'devices': devices.map((x) => x.toMap()).toList(),
      'id': id,
      'name': name,
    };
  }

  factory DeviceGroup.fromMap(Map<String, dynamic> map) {
    return DeviceGroup(
      description: map['description'] ?? '',
      devices: List<Device>.from(map['devices']?.map((x) => Device.fromMap(x))),
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory DeviceGroup.fromJson(String source) => DeviceGroup.fromMap(json.decode(source));

  @override
  String toString() {
    return 'DeviceGroup(description: $description, devices: $devices, id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is DeviceGroup &&
      other.description == description &&
      listEquals(other.devices, devices) &&
      other.id == id &&
      other.name == name;
  }

  @override
  int get hashCode {
    return description.hashCode ^
      devices.hashCode ^
      id.hashCode ^
      name.hashCode;
  }
}