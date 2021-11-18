class ProductModel {
  String id, name, image, description, categoryId, brand, size, color, price;

  bool isBestSelling;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.description,
    required this.categoryId,
    required this.brand,
    required this.isBestSelling,
    required this.size,
    required this.color,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json, String id) {
    return ProductModel(
        id: id,
        name: json['name'] ?? "",
        price: json['price'] ?? 0,
        image: json['image'] ?? "",
        description: json['description'] ?? "",
        categoryId: json['categoryId'] ?? "",
        brand: json['brand'] ?? "",
        isBestSelling: json['isBestSelling'] ?? false,
        size: json['size'] ?? "",
        color: json['color'] ?? "");
  }

  toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'image': image,
      'description': description,
      'categoryId': categoryId,
      'brand': brand,
      'isBestSelling': isBestSelling,
      'size': size,
      'color': color
    };
  }
}
