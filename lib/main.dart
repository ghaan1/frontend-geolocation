import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:frontend_geolocation/model/response/app.dart';
import 'package:frontend_geolocation/model/response/flavor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:frontend_geolocation/presentation/main_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var dio = Dio(BaseOptions(baseUrl: 'https://restaurant-api.dicoding.dev'));
  dio.interceptors.add(PrettyDioLogger(requestBody: true));

  GetIt.instance.registerSingleton(await SharedPreferences.getInstance());
  GetIt.instance.registerSingleton(
    App(
      flavor: Flavor.development,
      dio: dio,
    ),
  );
  runApp(const MainApp());
}
