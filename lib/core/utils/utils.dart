import 'package:shared_preferences/shared_preferences.dart';

class Utils {
  static bool isLogin = false;
  static bool isNotLogin = false;
  static bool _status = false;
  static String accessToken = "";
  static String baseUrl = "";
  static String hrmApiKey = "";

  static String socketurl =
      "http://websocket.smartsoft-bd.com:40110"; //live url
  // static String socketurl="http://192.168.0.100:8082";//local url

  static keepToken(String token) async {
    _status = await _cacheSession(SharedPreferencesKeys.accessToken, token);
    if (_status) {
      accessToken = token;
      isLogin = accessToken.isNotEmpty;
      isNotLogin = !isLogin;
    }
    _status = false;
  }

  static keepBaseURL(String url) async {
    _status = await _cacheSession(SharedPreferencesKeys.baseURL, url);
    if (_status) {
      baseUrl = url;
    }
    _status = false;
  }

  static keepHrmApiKey(String apiKey) async {
    _status = await _cacheSession(SharedPreferencesKeys.hrmApiKey, apiKey);
    if (_status) {
      hrmApiKey = apiKey;
    }
    _status = false;
  }

  static logout() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(SharedPreferencesKeys.accessToken)) {
      await prefs.remove(SharedPreferencesKeys.accessToken);
    }
    get();
  }

  static get() async {
    accessToken = await _getSessionFromCache(SharedPreferencesKeys.accessToken);
    hrmApiKey = await _getSessionFromCache(SharedPreferencesKeys.hrmApiKey);
    baseUrl = await _getSessionFromCache(SharedPreferencesKeys.baseURL);
    isLogin = accessToken.isNotEmpty;
    isNotLogin = !isLogin;
  }

  static Future _cacheSession(String key, String token) async {
    return await (await SharedPreferences.getInstance()).setString(key, token);
  }

  static Future _getSessionFromCache(String key) async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(key)) {
      /// It can be optimized
      return prefs.getString(key) ?? '';
    }
    return '';
  }
}

class SharedPreferencesKeys {
  static String accessToken = "user_access_token";
  static String baseURL = "api_base_url";
  static String hrmApiKey = "hrm_api_key";
}
