library test_default_server;

import 'package:dart_config/default_server.dart' as server_config;

main() {
  server_config.loadConfig().then(
      (Map config) => print(config["message"]),
      onError: (error) => print(error));
}