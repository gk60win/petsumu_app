class Fudo {
  final int id;
  final String title;
  final String content;
  final List<String> images;

  Fudo({
    required this.id,
    required this.title,
    required this.content,
    required this.images,
  });

  factory Fudo.fromJson(Map<String, dynamic> json) {
    List<String> imgs = [];
    for (int i = 1; i <= 10; i++) {
      final key = 'fudoimg$i';
      if (json[key] != null && json[key] is String && json[key] != '') {
        imgs.add(json[key]);
      }
    }

    return Fudo(
      id: json['id'],
      title: json['title']['rendered'],
      content: json['content']['rendered'],
      images: imgs,
    );
  }
}
