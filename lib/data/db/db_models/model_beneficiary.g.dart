// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_beneficiary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelBeneficiary _$ModelBeneficiaryFromJson(Map<String, dynamic> json) =>
    ModelBeneficiary(
      name: json['name'] as String,
      phone: (json['phone'] as num).toInt(),
    );

Map<String, dynamic> _$ModelBeneficiaryToJson(ModelBeneficiary instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
    };
