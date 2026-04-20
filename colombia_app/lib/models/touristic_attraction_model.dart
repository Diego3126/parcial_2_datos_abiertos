class TouristicAttraction {
  final int    id;
  final String name;
  final String description;
  final String latitude;
  final String longitude;
  final String cityName;

  TouristicAttraction({
    required this.id,
    required this.name,
    required this.description,
    required this.latitude,
    required this.longitude,
    required this.cityName,
  });

  factory TouristicAttraction.fromJson(Map<String, dynamic> json) {
    return TouristicAttraction(
      id:          json['id']          ?? 0,
      name:        json['name']        ?? '',
      description: json['description'] ?? '',
      latitude:    json['latitude']?.toString()  ?? '',
      longitude:   json['longitude']?.toString() ?? '',
      cityName:    json['city']?['name']         ?? '',
    );
  }
}