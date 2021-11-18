class CategoryModel {
  String? name = "", image = "", id = "";

  CategoryModel({this.name, this.image, this.id});

  toJson() {
    return {"name": name, "image": image, "id": id};
  }

  factory CategoryModel.fromJson(Map<String, dynamic> json, String id) {
    return CategoryModel(
      name: json["name"],
      image: json["image"],
      id: id,
    );
  }
}
