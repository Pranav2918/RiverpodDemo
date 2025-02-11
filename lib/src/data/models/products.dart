class Product {
  const Product(
      {required this.id,
      required this.title,
      required this.price,
      required this.image,
      required this.discount});

  final String id;
  final String title;
  final int price;
  final String image;
  final int discount;
}
