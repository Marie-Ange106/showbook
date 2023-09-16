// ignore: file_names
import 'dart:convert';
import 'dart:io';

class MyFile {
  final String path;

  MyFile(this.path);

  Future<Map<String, dynamic>> toJson() async {
    final file = File(path);
    if (!await file.exists()) {
      throw Exception('File does not exist');
    }
    final contents = await file.readAsString();
    return json.decode(contents);
  }
}