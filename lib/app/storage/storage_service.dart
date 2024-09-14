import 'package:montra/app/storage/storage_service_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  StorageService._internal();

  static Future<SharedPreferences>? _sharedPreference;

  static final StorageService _singleton = StorageService._internal();

  static StorageService getInstance() {
    _sharedPreference ??= SharedPreferences.getInstance();
    return _singleton;
  }

  //User Full Name
  Future<String?> get userFullName async {
    return _sharedPreference!.then((preference) {
      return preference.getString(StorageServiceKeys.kName);
    });
  }

  Future<void> saveUserFullName(String value) async {
    return _sharedPreference!.then((preference) {
      preference.setString(StorageServiceKeys.kName, value);
    });
  }

  //IS_LOGIN
  Future<bool?> get isLogin async {
    return _sharedPreference!.then((preference) {
      return preference.getBool(StorageServiceKeys.isLogin);
    });
  }

  Future<void> saveIsLogin(bool value) async {
    return _sharedPreference!.then((preference) {
      preference.setBool(StorageServiceKeys.isLogin, value);
    });
  }

  //EMAIL
  Future<String?> get email async {
    return _sharedPreference!.then((preference) {
      return preference.getString(StorageServiceKeys.kEmail);
    });
  }

  Future<void> saveEmail(String value) async {
    return _sharedPreference!.then((preference) {
      preference.setString(StorageServiceKeys.kEmail, value);
    });
  }

  //User UID
  Future<String?> get userUID async {
    return _sharedPreference!.then((preference) {
      return preference.getString(StorageServiceKeys.kUid);
    });
  }

  Future<void> saveUserUID(String value) async {
    return _sharedPreference!.then((preference) {
      preference.setString(StorageServiceKeys.kUid, value);
    });
  }

  //User Type
  Future<String?> get userType async {
    return _sharedPreference!.then((preference) {
      return preference.getString(StorageServiceKeys.kUserType);
    });
  }

  Future<void> saveUserType(String value) async {
    return _sharedPreference!.then((preference) {
      preference.setString(StorageServiceKeys.kUserType, value);
    });
  }
}
