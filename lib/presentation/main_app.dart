import 'package:flutter/material.dart';
import 'package:frontend_geolocation/core/theme/app_color.dart';

import 'package:frontend_geolocation/presentation/auth/login_provider.dart';
import 'package:frontend_geolocation/presentation/auth/login_screen.dart';
import 'package:frontend_geolocation/presentation/home/landing/landing_provider.dart';
import 'package:frontend_geolocation/presentation/splash/splash_screen.dart';
import 'package:provider/provider.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => LandingProvider()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primarySwatch: AppColor.primary, fontFamily: 'FontPoppins'),
          home: const SplashScreen(),
        ));
  }
}
