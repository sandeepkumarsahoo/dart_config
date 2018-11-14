library config_loader_filesystem;

import 'dart:async';
import 'dart:html';

import '../config.dart';

class ConfigHttpRequestLoader extends ConfigLoader {
  /**
   * A config loader will load
   */
  Future<String> loadConfig(String path) async {
    return await HttpRequest.getString(path);
  }
}
