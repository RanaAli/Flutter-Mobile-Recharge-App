// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: (json['id'] as num).toInt(),
      availableAmount: (json['availableAmount'] as num).toInt(),
      spentAmount: (json['spentAmount'] as num).toInt(),
      maxTotalAmount: (json['maxTotalAmount'] as num).toInt(),
      maxPerBeneficiaryAmount: (json['maxPerBeneficiaryAmount'] as num).toInt(),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'availableAmount': instance.availableAmount,
      'spentAmount': instance.spentAmount,
      'maxTotalAmount': instance.maxTotalAmount,
      'maxPerBeneficiaryAmount': instance.maxPerBeneficiaryAmount,
    };
