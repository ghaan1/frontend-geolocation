import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'login_state.dart';

class LoginProvider extends ChangeNotifier {
  final state = LoginState();

  changePasswordVisibility() {
    state.hidePassword = !state.hidePassword;
    notifyListeners();
  }

  Future<void> login() async {
    state.status = LoginStatus.loading;
    notifyListeners();
    var result = await state.authRepository.login(
      email: state.emailController.text.trim(),
      password: state.passwordController.text.trim(),
    );

    result.fold((err) {
      state.status = LoginStatus.error;
      Fluttertoast.showToast(msg: err.message ?? '');
    }, (res) {
      state.status = LoginStatus.success;
      state.sessionRepository.saveToken(res.data?.accessToken ?? '');
    });
    notifyListeners();
  }
}