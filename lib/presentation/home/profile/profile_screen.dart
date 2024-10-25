import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend_geolocation/core/provider/session/session_provider.dart';
import 'package:frontend_geolocation/core/theme/app_color.dart';
import 'package:frontend_geolocation/presentation/auth/login_screen.dart';
import 'package:provider/provider.dart';

import 'profile_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late ProfileProvider _provider;

  @override
  void initState() {
    super.initState();
    _provider = ProfileProvider();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => _provider,
      builder: (context, child) => _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    return Consumer2<ProfileProvider, SessionProvider>(
        builder: (_, provider, sessionProvider, __) {
      return Scaffold(
        body: Container(
          child: IconButton(
            icon: Image.asset(
              'assets/icons/ic-clockout.png',
              width: 20,
              color: AppColor.primary,
            ),
            onPressed: () async {
              sessionProvider.deleteToken();
              Navigator.pushAndRemoveUntil(
                context,
                CupertinoPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
                (route) => false, // Removes all previous routes
              );
            },
          ),
        ),
      );
    });
  }
}
