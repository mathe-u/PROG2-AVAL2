import 'dart:convert';
import 'dart:io';

void main() {
  final jsonFile = json.decode(File("./data/media.json").readAsStringSync());
  for (var jsonItem in jsonFile) {
    print(jsonItem["type"]);
  }
}
