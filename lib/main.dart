import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:frontend_geolocation/core/app.dart';
import 'package:frontend_geolocation/presentation/main_app.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get_it/get_it.dart';
import 'package:frontend_geolocation/core/enum/flavor.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var dio = Dio(BaseOptions(baseUrl: 'https://geolocation.polinema.web.id/api'));
  dio.interceptors.add(PrettyDioLogger(requestBody: true));

  final sharedPrefs = await SharedPreferences.getInstance();
  final app = App(
    flavor: Flavor.development,
    dio: dio,
  );

  GetIt.instance.registerSingleton<SharedPreferences>(sharedPrefs);
  GetIt.instance.registerSingleton<App>(app);

  runApp(const MainApp());
}
