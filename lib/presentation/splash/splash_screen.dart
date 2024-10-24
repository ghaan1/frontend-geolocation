import 'package:flutter/material.dart';
import 'package:frontend_geolocation/presentation/home/navigation/navigation_screen.dart';
import 'package:frontend_geolocation/util/app_color.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Future.delayed(const Duration(seconds: 2), () {
    //   Navigator.pushReplacement(context,
    //       MaterialPageRoute(builder: (context) => const NavigationScreen()));
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: AppColor.primaryColor,
        ),
        child: Stack(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: AppColor.primaryColor.shade400,
                    shape: BoxShape.circle),
                child: Column(
                  children: [
                    Center(
                      child: SizedBox(
                        width: 250,
                        height: 250,
                        child: Image.asset('assets/images/logo-white.png'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            //make child loading indicator ios
            child: Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                strokeWidth: 6,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
