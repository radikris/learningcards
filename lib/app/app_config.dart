import 'package:injectable/injectable.dart';

abstract class Config {
  String get apiKey;
  String get baseUrl;
}

@Environment(Environment.dev)
@Singleton(as: Config)
class ConfigDev implements Config {
  @override
  String get baseUrl => 'https://cross-platform.rp.devfactory.com';
  @override
  String get apiKey => 'YOUR_API_KEY';
}

@Environment(Environment.prod)
@Singleton(as: Config)
class ConfigProd extends Config {
  @override
  String get baseUrl => 'https://cross-platform.rp.devfactory.com';
  @override
  String get apiKey => 'YOUR_API_KEY';
}

class AppConstants {
  static int PRELOAD_PAGE = 0;
  static int ANIMATION_DURATION = 300; //ms
}
