import 'dart:io';
import 'dart:convert';
import './media.dart';
import './music.dart';
import './audio_book.dart';
import './movie.dart';

class DigitalLibrary {
  DigitalLibrary();
  
  List<Media> storage = [];

  void addMedia(Media media) {
    storage.add(media);
  }

  void loadMedia(String path) {
    storage.clear();
    final jsonContent = json.decode(File(path).readAsStringSync());
    for (Map item in jsonContent) {
      if (item["type"] == "music") {
        addMedia(Music(MediaType.music, item["title"], item["duration"], item["name"]));
      } else if (item["type"] == "book") {
        addMedia(AudioBook(MediaType.book, item["title"], item["duration"], item["name"]));
      } else if (item["type"] == "movie") {
        addMedia(Movie(MediaType.movie, item["title"], item["duration"], item["name"]));
      }
    }
  }

  void listMedia([MediaType? mediaType]) {
    print("TIPO    TÍTULO                        NOME                     DURAÇÃO(MIN)");
    if (mediaType == null) {
      for (Media media in storage) {
        print("${media.type.type.padRight(8)}${media.title.padRight(30)}${media.name.padRight(20)}${media.duration.toString().padLeft(17)}");
      }
    } else {
      for (Media media in storage) {
        if (media.type == mediaType) {
          print("${media.type.type.padRight(8)}${media.title.padRight(30)}${media.name.padRight(20)}${media.duration.toString().padLeft(17)}");
        }
      }
    }
  }

  int totalMediaDuration([MediaType? mediaType]) {
    int total = 0;
    List<Media> storage = [];
    if (mediaType == null) {
      for (Media media in storage) {
        total += media.duration;
      }
    } else {
      for (Media media in storage) {
        if (media.type == mediaType) {
          total += media.duration;
        }
      }
    }
    return total;
  }
}

