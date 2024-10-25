import 'package:flutter/material.dart';
import 'session_state.dart';

class SessionProvider extends ChangeNotifier {
  final state = SessionState();

  Future<void> loadToken() async {
    state.token = await state.sessionRepository.loadToken();
    notifyListeners();
  }

  Future<void> deleteToken() async {
    await state.sessionRepository.deleteToken();
    notifyListeners();
  }
}
