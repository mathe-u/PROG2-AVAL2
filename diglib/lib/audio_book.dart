import './media.dart';

class AudioBook extends Media {
  final String author;

  AudioBook(
    super.type,
    super.title,
    super.duration,
    this.author
    );

  @override
  String get name => author;

}
