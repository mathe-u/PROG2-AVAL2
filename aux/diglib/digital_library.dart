import 'dart:io';
import 'dart:convert';
import './media.dart';
import './movie.dart';
import './music.dart';
import './audio_book.dart';

class DigitalLibrary {
  DigitalLibrary();
  List<Media> storage = [];
  void addMedia(Media media) {
    storage.add(media);
  }

  String loadMedia([Media? mediaType]) {
    final file = File('./media.json');
    final contents = file.readAsStringSync();
    return json.decode(contents);
  }

  List<String> listMedia([Media? mediaType]) {
    List<String> list = [];

    if(mediaType == null){
      for(Media media in storage){
        list.add("${media.type} ${media.title} ${media.name} ${media.duration}");
      }
    }else{
      for(Media media in storage){
        if (media.type == mediaType.type) {
          list.add("${media.type} ${media.title} ${media.name} ${media.duration}");
        }
      }
    }

    return list;

    }
  }

  int totalMediaDuration([Media? mediaType]) {
    int total = 0;
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
