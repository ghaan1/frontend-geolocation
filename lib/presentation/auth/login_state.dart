import 'package:flutter/material.dart';
import 'package:frontend_geolocation/model/user/user_model.dart';
import 'package:frontend_geolocation/data/repositories/local/session_repository.dart';
import 'package:frontend_geolocation/data/repositories/remote/auth_repository.dart';

enum LoginStatus { iddle, loading, success, error }

class LoginState {
  var status = LoginStatus.iddle;
  UserModel _user = UserModel();
  UserModel get user => _user;
  set user(UserModel value) => _user = value;

  var authRepository = AuthRepository();
  var sessionRepository = SessionRepository();

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  var hidePassword = true;

  LoginState() {
    // emailController.text = 'adi@mail.com';
    // passwordController.text = 'password';
    emailController.text = 'contractor@gmail.com';
    passwordController.text = '112233';
  }
}
