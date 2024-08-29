import 'package:json_annotation/json_annotation.dart';

part 'model_user.g.dart';

@JsonSerializable()
class User {
  int id;
  int availableAmount = 0;
  int spentAmount = 0;
  int maxMonthlyAmount = 50;
  int maxPerBeneficiaryAmount = 10;

  User({
    required this.id,
    required this.availableAmount,
    required this.spentAmount,
    required this.maxMonthlyAmount,
    required this.maxPerBeneficiaryAmount,
  });

  Map<String, dynamic> toJson() => _$UserToJson(this);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'availableAmount': availableAmount,
      'spentAmount': spentAmount,
      'maxMonthlyAmount': maxMonthlyAmount,
      'maxPerBeneficiaryAmount': maxPerBeneficiaryAmount,
    };
  }
}
