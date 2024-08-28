import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'model_beneficiary.g.dart';

@JsonSerializable()
class ModelBeneficiary {
  int? id;
  final String name;
  final String phone;

  ModelBeneficiary({
    this.id,
    required this.name,
    required this.phone,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
    };
  }

  factory ModelBeneficiary.fromMap(Map<String, dynamic> map) {
    return ModelBeneficiary(
      name: map['name'] as String,
      phone: map['phone'] as String,
    );
  }

  factory ModelBeneficiary.fromJson(Map<String, dynamic> json) =>
      _$ModelBeneficiaryFromJson(json);

  Map<String, dynamic> toJson() => _$ModelBeneficiaryToJson(this);

  static String convertListToJson(List<ModelBeneficiary> words) {
    List<Map<String, dynamic>> jsonData =
        words.map((word) => word.toMap()).toList();
    return jsonEncode(jsonData);
  }

  static List<ModelBeneficiary> fromJSonToList(String json) {
    List<dynamic> jsonData = jsonDecode(json);
    return jsonData.map((map) => ModelBeneficiary.fromMap(map)).toList();
  }
}
