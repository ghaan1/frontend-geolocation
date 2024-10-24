import 'package:flutter/material.dart';
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
    return Consumer<ProfileProvider>(builder: (_, provider, __) {
      return const Scaffold();
    });
  }
}
