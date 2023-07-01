import './media.dart';

class Music extends Media {
  final String artist;

  Music(
    super.type,
    super.title,
    super.duration,
    this.artist
   );

  @override
  String get name => artist;
}
