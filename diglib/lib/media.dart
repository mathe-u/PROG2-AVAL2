enum MediaType {
  movie("filme"),
  book("livro"),
  music("música");

  final String type;

  const MediaType(this.type);
}

abstract class Media {
  final MediaType type;
  final String title;
  final int duration;

  Media(this.type, this.title, this.duration);

  String get name;
}
