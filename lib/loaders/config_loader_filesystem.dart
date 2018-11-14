library config_loader_httprequest;

import 'dart:async';
import 'dart:io';

import '../config.dart';

class ConfigFilesystemLoader extends ConfigLoader {
  /**
   * A config loader will load
   */
  Future<String> loadConfig(String path) async {
    return new File('test/$path').readAsStringSync();
  }
}
