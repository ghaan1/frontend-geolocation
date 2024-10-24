import 'package:flutter/material.dart';
import 'package:frontend_geolocation/presentation/home/landing/landing_provider.dart';
import 'package:provider/provider.dart';

import 'package:frontend_geolocation/presentation/splash/splash_screen.dart';
import 'package:frontend_geolocation/util/app_color.dart';

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
              primarySwatch: AppColor.primaryColor, fontFamily: 'FontPoppins'),
          home: const SplashScreen(),
        ));
  }
}
