enum AmountsEnum {
  five('Aed 5', 5),
  ten('Aed 10', 10),
  twenty('Aed 20', 20),
  thirty('Aed 30', 30),
  fifty('Aed 50', 50),
  seventyFive('Aed 75', 75),
  hundred('Aed 100', 100);

  const AmountsEnum(this.text, this.amount);

  final int amount;
  final String text;
}
