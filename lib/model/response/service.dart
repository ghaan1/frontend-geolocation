import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app.dart';

class Service {
  static App get app => GetIt.instance.get<App>();
  static SharedPreferences get preference =>
      GetIt.instance.get<SharedPreferences>();
}
