class Fudo {
  final int id;
  final String title;
  final String content;
  final int featuredMedia;

  Fudo({
    required this.id,
    required this.title,
    required this.content,
    required this.featuredMedia,
  });

  factory Fudo.fromJson(Map<String, dynamic> json) {
    return Fudo(
      id: json["id"],
      title: json["title"]["rendered"] ?? "",
      content: json["content"]["rendered"] ?? "",
      featuredMedia: json["featured_media"] ?? 0,
    );
  }
}
