class Album {
  late final int? userId;
  late final int id;
  late final String? title;

  Album({required this.userId, required this.id, required this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'] as int?,
      id: json['id'] as int,
      title: json['title'] as String?,
    );
  }
}
