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
import 'package:frontend_geolocation/presentation/splash/splash_screen.dart';
import 'package:frontend_geolocation/util/string_extension.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginProvider _provider;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _provider = LoginProvider();
  }

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
            child: Column(
              children: [
                Stack(
                  children: [
                    Image.asset('assets/images/bg-header.png'),
                    Positioned(
                      bottom: 32,
                      left: 16,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Login Akun frontend_geolocation',
                            style: textExtraLargeBold.copyWith(
                              color: AppColor.white,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Buat akun Anda',
                            style: textRegular.copyWith(
                              color: AppColor.white,
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
                        const Label(text: 'Email', isRequired: true),
                        Edittext(
                          controller: provider.state.emailController,
                          hint: 'Masukkan email',
                          inputType: TextInputType.emailAddress,
                          onChanged: ((value) =>
                              _formKey.currentState!.validate()),
                          validator: (val) {
                            if (!val!.isValidEmail) return 'Email tidak valid';
                            return null;
                          },
                        ),
                        const SizedBox(height: 8),
                        const Label(text: 'Password', isRequired: true),
                        Edittext(
                          controller: provider.state.passwordController,
                          hint: 'Masukkan password',
                          obscureText: provider.state.hidePassword,
                          onChanged: ((value) =>
                              _formKey.currentState!.validate()),
                          validator: (val) {
                            if (!val!.isNotEmpty) {
                              return 'Password belum diisi';
                            }
                            return null;
                          },
                          suffix: InkWell(
                            onTap: () {
                              _provider.changePasswordVisibility();
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
                              await _provider.login();
                              if (provider.state.status ==
                                  LoginStatus.success) {
                                if (context.mounted) {
                                  Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                      builder: (context) =>
                                          const LandingScreen(),
                                    ),
                                  );
                                }
                              }
                            }
                          },
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Belum punya akun?', style: textRegular),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) =>
                                          // const RegisterScreen(),
                                          SplashScreen()),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Daftar',
                                  style: textRegularBold.copyWith(
                                    color: AppColor.primary,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
