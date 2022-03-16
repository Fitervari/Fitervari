import 'dart:convert';

class ActivationCode {
  final String code;
  final int id;
  final bool valid;
  ActivationCode({
    required this.code,
    required this.id,
    required this.valid,
  });

  ActivationCode copyWith({
    String? code,
    int? id,
    bool? valid,
  }) {
    return ActivationCode(
      code: code ?? this.code,
      id: id ?? this.id,
      valid: valid ?? this.valid,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'id': id,
      'valid': valid,
    };
  }

  factory ActivationCode.fromMap(Map<String, dynamic> map) {
    return ActivationCode(
      code: map['code'] ?? '',
      id: map['id']?.toInt() ?? 0,
      valid: map['valid'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory ActivationCode.fromJson(String source) => ActivationCode.fromMap(json.decode(source));

  @override
  String toString() => 'ActivationCode(code: $code, id: $id, valid: $valid)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ActivationCode &&
      other.code == code &&
      other.id == id &&
      other.valid == valid;
  }

  @override
  int get hashCode => code.hashCode ^ id.hashCode ^ valid.hashCode;
}