class Product {
  Product({
    required this.name,
    required this.price,
    required this.allergens,
  });

  final String name;
  final double price;
  final List<String> allergens;
}
