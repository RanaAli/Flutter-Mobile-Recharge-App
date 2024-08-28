// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_beneficiary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelBeneficiary _$ModelBeneficiaryFromJson(Map<String, dynamic> json) =>
    ModelBeneficiary(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String,
      phone: json['phone'] as String,
    );

Map<String, dynamic> _$ModelBeneficiaryToJson(ModelBeneficiary instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
    };
