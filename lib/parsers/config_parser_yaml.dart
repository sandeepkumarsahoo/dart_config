library config_parser_yaml;

import 'package:yaml/yaml.dart' as YAML;

import '../config.dart';

class YamlConfigParser implements ConfigParser {
  @override
  Map<String, dynamic> parse(String configText) {
    var map = YAML.loadYaml(configText);
    if (map is YAML.YamlMap) {
      print('YMAL result is a YamlMap');
      Map<String, dynamic> asMap = {};
      for (String key in map.keys) {
        asMap[key] = map[key];
      }
      return asMap;
    } else if (map is Map<String, dynamic>) {
      print('YMAL result is a Map');
      return map;
    } else {
      print('YMAL result NOT is a Map');
      return {};
    }
  }
}
