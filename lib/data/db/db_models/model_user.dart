import 'package:json_annotation/json_annotation.dart';

part 'model_user.g.dart';

@JsonSerializable()
class User {
  int id;
  int availableAmount = 0;

  User({required this.id, required this.availableAmount});

  Map<String, dynamic> toJson() => _$UserToJson(this);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'availableAmount': availableAmount,
    };
  }
}
