library config_parser_json;

import 'dart:convert';

import '../config.dart';

class JsonConfigParser implements ConfigParser {

  @override
  Map<String, dynamic> parse(String configText) {
    var map = json.decode(configText);
    if (map is Map<String, dynamic>) {
      print('JSON was a map');
      return map;
    } else {
      print('JSON was NOT a map');
      return {};
    }
  }
}