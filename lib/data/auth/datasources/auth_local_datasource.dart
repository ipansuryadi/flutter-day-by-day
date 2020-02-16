import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDatasource {
  String getToken(String key);
  Future<void> setToken(String key, String value);
}

class AuthLocalDatasourceImpl implements AuthLocalDatasource{
  final SharedPreferences sharedPreferences;

  AuthLocalDatasourceImpl(this.sharedPreferences);
  
  @override
  Future<void> setToken(String key, String value) async {
    await sharedPreferences.setString(key, value);
  }

  @override
  String getToken(String key) {
    return sharedPreferences.getString(key);
  }

}