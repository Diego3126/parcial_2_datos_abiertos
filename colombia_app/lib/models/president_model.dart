class President {
  final int    id;
  final String name;
  final String lastName;
  final String description;
  final String startPeriodDate;
  final String endPeriodDate;
  final String image;

  President({
    required this.id,
    required this.name,
    required this.lastName,
    required this.description,
    required this.startPeriodDate,
    required this.endPeriodDate,
    required this.image,
  });

  factory President.fromJson(Map<String, dynamic> json) {
    return President(
      id:              json['id']              ?? 0,
      name:            json['name']            ?? '',
      lastName:        json['lastName']        ?? '',
      description:     json['description']     ?? '',
      startPeriodDate: json['startPeriodDate'] ?? '',
      endPeriodDate:   json['endPeriodDate']   ?? '',
      image:           json['image']           ?? '',
    );
  }
}