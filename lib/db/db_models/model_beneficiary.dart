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
}
