import 'package:shared_preferences/shared_preferences.dart';

class CachingUtils {

  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> cacheUser({
    required String email,
    required String name,
    required String token,
    required String id,
}) async {
    await _prefs.setString('email', email);
    await _prefs.setString('name', name);
    await _prefs.setString('token', token);
    await _prefs.setString('user_id', id);
  }

  static Future<void> deleteUser() async {
    await _prefs.remove('email');
    await _prefs.remove('name');
    await _prefs.remove('token');
    await _prefs.remove('user_id');
  }

  static bool get isLogged {
    return _prefs.containsKey('token');
  }

  static String get email {
    return _prefs.getString('email') ?? '';
  }

  static String get userID {
    return _prefs.getString('user_id') ?? '';
  }

  static String get name {
    return _prefs.getString('name') ?? '';
  }

  static String get token {
    return _prefs.getString('token') ?? '';
  }



}