import 'dart:io';
import 'dart:convert';
import 'package:diglib/media.dart';

class DigitalLibrary {
  DigitalLibrary();
  List<Media> storage = [];

  void addMedia(Media media) {
    storage.add(media);
  }

  List<dynamic> loadMedia(String path) {
    final file = File(path);
    final contents = file.readAsStringSync();
    return json.decode(contents);
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

