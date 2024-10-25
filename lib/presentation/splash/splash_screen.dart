import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend_geolocation/core/provider/session/session_provider.dart';
import 'package:frontend_geolocation/presentation/auth/login_screen.dart';
import 'package:frontend_geolocation/presentation/home/landing/landing_screen.dart';
import 'package:frontend_geolocation/presentation/home/navigation/navigation_screen.dart';
import 'package:frontend_geolocation/presentation/home/profile/profile_screen.dart';
import 'package:frontend_geolocation/presentation/splash/splash_provider.dart';
import 'package:frontend_geolocation/core/theme/app_color.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late SplashProvider _provider;
  @override
  void initState() {
    super.initState();
    _provider = SplashProvider();
    initData();
  }

  initData() async {
    var sessionProvider = Provider.of<SessionProvider>(context, listen: false);

    await sessionProvider.loadToken();
    print(sessionProvider.state.token);
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        CupertinoPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => _provider,
      builder: (context, child) => _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    final state = context.watch<SplashProvider>().state;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: AppColor.primary,
        ),
        child: Stack(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: AppColor.primary.shade400, shape: BoxShape.circle),
                child: Column(
                  children: [
                    Center(
                      child: SizedBox(
                        width: 100,
                        height: 100,
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
