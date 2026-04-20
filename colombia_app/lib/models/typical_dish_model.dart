class TypicalDish {
  final int    id;
  final String name;
  final String description;
  final String image;
  final String region;

  TypicalDish({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.region,
  });

  factory TypicalDish.fromJson(Map<String, dynamic> json) {
    return TypicalDish(
      id:          json['id']          ?? 0,
      name:        json['name']        ?? '',
      description: json['description'] ?? '',
      image:       json['image']       ?? '',
      region:      json['region']?['name'] ?? '',
    );
  }
}