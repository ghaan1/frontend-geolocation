import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend_geolocation/core/theme/app_color.dart';
import 'package:frontend_geolocation/core/theme/app_font.dart';
import 'package:frontend_geolocation/core/widget/button.dart';
import 'package:frontend_geolocation/core/widget/edittext.dart';
import 'package:frontend_geolocation/core/widget/label.dart';
import 'package:frontend_geolocation/presentation/auth/login_provider.dart';
import 'package:frontend_geolocation/presentation/auth/login_state.dart';
import 'package:frontend_geolocation/presentation/home/landing/landing_screen.dart';
import 'package:frontend_geolocation/presentation/home/navigation/navigation_screen.dart';
import 'package:frontend_geolocation/presentation/splash/splash_screen.dart';
import 'package:frontend_geolocation/util/string_extension.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => LoginProvider(),
      builder: (context, child) => _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    return Consumer<LoginProvider>(
      builder: (_, provider, __) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Container(
              color: AppColor.white,
              child: Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 400,
                        child: Center(
                          child: Image.asset(
                            'assets/images/logo-primary.png',
                            width: 150,
                            height: 150,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 32,
                        left: 16,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Login',
                              style: textExtraLargeBold.copyWith(
                                color: AppColor.primaryText,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Login to continue use the app',
                              style: textRegular.copyWith(
                                color: AppColor.primaryText,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          const SizedBox(height: 8),
                          const Label(
                              text: 'Username',
                              isRequired: true,
                              fontWeight: FontWeight.bold),
                          Edittext(
                            controller: provider.state.emailController,
                            hint: 'Enter username',
                            inputType: TextInputType.emailAddress,
                            onChanged: ((value) =>
                                _formKey.currentState!.validate()),
                            validator: (val) {
                              if (!val!.isNotEmpty) {
                                return 'Username is required';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 8),
                          const Label(
                              text: 'Password',
                              isRequired: true,
                              fontWeight: FontWeight.bold),
                          Edittext(
                            controller: provider.state.passwordController,
                            hint: 'Enter password',
                            obscureText: provider.state.hidePassword,
                            onChanged: ((value) =>
                                _formKey.currentState!.validate()),
                            validator: (val) {
                              if (!val!.isNotEmpty) {
                                return 'Password is required';
                              }
                              return null;
                            },
                            suffix: InkWell(
                              onTap: () {
                                provider
                                    .changePasswordVisibility(); // Use provider here
                              },
                              child: Container(
                                padding: const EdgeInsets.all(12.0),
                                child: Image.asset(
                                  provider.state.hidePassword
                                      ? 'assets/icons/ic-eye-off.png'
                                      : 'assets/icons/ic-eye.png',
                                  width: 20,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 32),
                          Button(
                            isLoading:
                                provider.state.status == LoginStatus.loading,
                            label: 'Login',
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                await provider.login();
                                if (provider.state.status ==
                                    LoginStatus.success) {
                                  if (context.mounted) {
                                    Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                        builder: (context) =>
                                            const NavigationScreen(),
                                      ),
                                    );
                                  }
                                }
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
