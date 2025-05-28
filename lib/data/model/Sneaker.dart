class Product {
  final int id;
  final String name;
  final String image;
  final int originalPrice;
  final int discountedPrice;
  final String country;

  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.originalPrice,
    required this.discountedPrice,
    required this.country,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: int.parse(json['id'].toString()),

      // 👈 تبدیل امن‌تر
      name: json['name'],
      image: json['image'],
      originalPrice: json['originalPrice'],
      discountedPrice: json['discountedPrice'],
      country: json['country'],
    );
  }
}
