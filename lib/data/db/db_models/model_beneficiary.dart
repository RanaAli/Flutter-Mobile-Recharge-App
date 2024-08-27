import 'dart:convert';

class ModelBeneficiary {
  final String name;
  final int phone;

  const ModelBeneficiary({
    required this.name,
    required this.phone,
  });

  Map<String, Object?> toMap() {
    return {
      'name': name,
      'phone': phone,
    };
  }

  @override
  String toString() {
    return 'ModelBeneficiary{name: $name, phone: $phone}';
  }

  factory ModelBeneficiary.fromJson(Map<String, dynamic> json) {
    return ModelBeneficiary(
      name: json['name'],
      phone: json['phone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
    };
  }
}

String modelBeneficiaryToJson(ModelBeneficiary beneficiary) {
  return jsonEncode(beneficiary.toJson());
}

ModelBeneficiary jsonToModelBeneficiary(String jsonString) {
  return ModelBeneficiary.fromJson(jsonDecode(jsonString));
}
