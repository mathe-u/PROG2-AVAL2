import 'dart:io';
import 'dart:convert';
import './media.dart';
import './music.dart';

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
      if (item["type"] == "música") {
        addMedia(Music(item["type"], item["title"], item["duration"], item["name"]));
      }
    }
  }

  List<String> listMedia([MediaType? mediaType]) {
    List<String> list = [];

    if (mediaType == null) {
      for (Media media in storage) {
        list.add("${media.type} ${media.title} ${media.name} ${media.duration}");
      }
    } else {
      for (Media media in storage) {
        if (media.type.type == mediaType.type) {
          list.add("${media.type} ${media.title} ${media.name} ${media.duration}");
        }
      }
    }
    return list;
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
        if (media.type == mediaType.type) {
          total += media.duration;
        }
      }
    }
    return total;
  }
}

