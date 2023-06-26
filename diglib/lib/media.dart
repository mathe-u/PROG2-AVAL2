enum MediaType {
  movie('filme'),
  book('livro'),
  music('musica');

  const MediaType(this.name);
  final String name;
}

abstract class Media {
  final MediaType type;
  final String title;
  final int duration;

  Media(this.type, this.title, this.duration);

  String get name;
}
