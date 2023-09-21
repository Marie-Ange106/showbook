class TypeModel {
  int id;
  String name;
  DateTime? createdAt;
  DateTime? updatedAt;

  TypeModel({
    required this.id,
    required this.name,
    this.createdAt,
    this.updatedAt,
  });

  factory TypeModel.fromJson(Map<String, dynamic> json) => TypeModel(
        id: json['id'],
        name: json['name'],
        createdAt: json['created_at'] != null
            ? DateTime.parse(json['created_at'])
            : null,
        updatedAt: json['updated_at'] != null
            ? DateTime.parse(json['updated_at'])
            : null,
      );
}
