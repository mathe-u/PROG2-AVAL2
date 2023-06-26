import './media.dart';

class Movie extends Media {
  final String director;

  Movie(super.type,
  super.title,
  super.duration,
  this.director
  );
  
  @override
  String get name => director;
}
