class CategoryModel {
  int id;
  String name;
  String imagePath;
  String createdAt;
  String updatedAt;
  String? deletedAt;

  CategoryModel({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.createdAt,
    required this.updatedAt,
     this.deletedAt,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      imagePath: json['image_path'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
    );
  }
}
