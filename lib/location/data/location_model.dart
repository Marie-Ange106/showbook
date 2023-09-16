class LocationModel {
  int id;
  String name;
  double latitude;
  double longitude;
  String country;
  String city;
  String neighborhood;
  String createdAt;
  String updatedAt;

  LocationModel({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.country,
    required this.city,
    required this.neighborhood,
    required this.createdAt,
    required this.updatedAt,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      id : json['id'],
      name: json['name'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      country: json['country'],
      city: json['city'],
      neighborhood: json['neighborhood'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
