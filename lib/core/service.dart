import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app.dart';

class Service {
  final GetIt sl = GetIt.instance;
  static App get app => GetIt.instance.get<App>();

  /// Helper to get main App instance, one and only
  // static App get app => GetIt.instance.get<App>();
  static SharedPreferences get preference =>
      GetIt.instance.get<SharedPreferences>();
}
