import 'package:frontend_geolocation/core/service.dart';

class SessionRepository {
  /// Shared preferences key
  static const String keyAccessToken = 'token';

  Future<String> loadToken() async {
    String token = "";
    if (Service.preference.containsKey(keyAccessToken)) {
      token = Service.preference.getString(keyAccessToken).toString();
    }
    return token;
  }

  Future<String> saveToken(String token) async {
    await Service.preference.setString(keyAccessToken, token);
    return token;
  }

  Future<void> deleteToken() async {
    await Service.preference.remove(keyAccessToken);
  }
}
