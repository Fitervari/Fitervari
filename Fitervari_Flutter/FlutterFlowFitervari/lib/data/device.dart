import 'dart:convert';

class Device {
  final int id;
  final int uniqueNumber;
  Device({
    required this.id,
    required this.uniqueNumber,
  });

  Device copyWith({
    int? id,
    int? uniqueNumber,
  }) {
    return Device(
      id: id ?? this.id,
      uniqueNumber: uniqueNumber ?? this.uniqueNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'uniqueNumber': uniqueNumber,
    };
  }

  factory Device.fromMap(Map<String, dynamic> map) {
    return Device(
      id: map['id']?.toInt() ?? 0,
      uniqueNumber: map['uniqueNumber']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Device.fromJson(String source) => Device.fromMap(json.decode(source));

  @override
  String toString() => 'Device(id: $id, uniqueNumber: $uniqueNumber)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Device &&
      other.id == id &&
      other.uniqueNumber == uniqueNumber;
  }

  @override
  int get hashCode => id.hashCode ^ uniqueNumber.hashCode;
}