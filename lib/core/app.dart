import 'package:dio/dio.dart';
import 'package:frontend_geolocation/core/enum/flavor.dart';

class App {
  final Flavor flavor;
  final Dio dio;

  App({
    required this.flavor,
    required this.dio,
  });
}
