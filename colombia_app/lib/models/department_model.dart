class Department {
  final int id;
  final String name;
  final String description;
  final String surface;
  final int population;

  Department({
    required this.id,
    required this.name,
    required this.description,
    required this.surface,
    required this.population,
  });

  factory Department.fromJson(Map<String, dynamic> json) {
    return Department(
      id:          json['id']          ?? 0,
      name:        json['name']        ?? '',
      description: json['description'] ?? '',
      surface:     json['surface']?.toString() ?? '',
      population:  json['population']  ?? 0,
    );
  }
}