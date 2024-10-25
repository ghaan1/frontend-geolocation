import 'package:frontend_geolocation/data/repositories/local/session_repository.dart';

class SessionState {
  var sessionRepository = SessionRepository();
  String token = '';

  SessionState() {
    // constructor
  }
}
