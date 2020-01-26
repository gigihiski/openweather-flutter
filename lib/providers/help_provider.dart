import 'dart:convert';

import 'package:flutter/services.dart';

class HelpProvider {
  Future<String> fetchHTMLFile(String path) async {
    try {
      String fileText = await rootBundle.loadString(path);
      return Uri.dataFromString(fileText,
              mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
          .toString();
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return null;
    }
  }
}
