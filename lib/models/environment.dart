import 'package:flutter_dotenv/flutter_dotenv.dart';

const bool kReleaseMode = bool.fromEnvironment('dart.vm.product');

class Environment {
  static String get fileName => kReleaseMode ? ".env" : ".env.local";
  static String get apiUrl => dotenv.env['API_URL'] ?? 'MY_FALLBACK';
}