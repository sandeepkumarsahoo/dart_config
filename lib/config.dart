library config;

import 'dart:async';

/**
 * The main config class.  
 * 
 * Create an instance of this class
 * passing in a the [_configPathOrUrl] of the config file to load,  
 * a [ConfigLoader] implementation and a 
 * [ConfigParser] implmentation.
 * 
 * Then call [readConfig] to load and parse the config.
 * 
 */
class Config  {
  final ConfigLoader _configLoader;
  final ConfigParser _configParser;
  final String _configPathOrUrl;
  
  // [configValues is only populated once [readConfig]'s future is completed
  Map<String,dynamic> configValues;
  
  /**
   * 
   */
  Config(String this._configPathOrUrl,
      ConfigLoader this._configLoader, 
      ConfigParser this._configParser);
  
  /**
   * Loads the config using the [ConfigLoader] and 
   * parses the file using the [ConfigParser]
   * 
   * Returns a [Future<Map>] containing key/value pairs
   * 
   */
  Future<Map<String, dynamic>> readConfig() async {
    // load, then parse
    String configText = await _configLoader.loadConfig(_configPathOrUrl);
    configValues = _configParser.parse(configText);
    return configValues;
  }
  
}

/**
 * Provides a mechanism for a config to be loaded.  From the 
 * filesystem (in server-side Dart), or from a URL in the browser 
 * (in client side Dart) are just two possible locations.
 */
abstract class ConfigLoader {
  
  /**
   * A config loader will load the config data from the [pathOrUrl], and
   * return the contents of the file as a `Future<String>`
   */
  Future<String> loadConfig(String pathOrUrl);

}

/**
 * Provides a mechanism for a config to be parsed
 * Configs are always extracted as a `Map<String,Object>`, with
 * the map's value being one of the "primitive" Dart types:  `Map`, `List`, 
 * `int`, `num`, `double`, `String`, `bool`, `null`.
 */
abstract class ConfigParser {
  
  /**
   * Returns a Config object from the parsed config file.
   */
  Map<String,dynamic> parse(String configText);
}