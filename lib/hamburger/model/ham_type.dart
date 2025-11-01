enum HamType {
  sencilla('Sencilla', 20),
  doble('Doble', 25),
  triple('Triple', 28);

  final String name;
  final double price;
  const HamType(this.name, this.price);
}