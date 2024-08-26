enum AmountsEnum {
  five('AED 5'),
  ten('AED 10'),
  twenty('AED 20'),
  thirty('AED 30'),
  fifty('AED 50'),
  seventyFive('AED 75'),
  hundred('AED 100');

  const AmountsEnum(this.text);

  final String text;
}