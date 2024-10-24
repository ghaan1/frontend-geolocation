import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'template_provider.dart';

class TemplateScreen extends StatefulWidget {
  const TemplateScreen({super.key});

  @override
  State<TemplateScreen> createState() => _TemplateScreenState();
}

class _TemplateScreenState extends State<TemplateScreen> {
  late TemplateProvider _provider;

  @override
  void initState() {
    super.initState();
    _provider = TemplateProvider();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => _provider,
      builder: (context, child) => _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    return Consumer<TemplateProvider>(builder: (_, provider, __) {
      return const Scaffold();
    });
  }
}
