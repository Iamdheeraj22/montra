class StorageServiceKeys {
  StorageServiceKeys._internal();
  static final StorageServiceKeys _instance = StorageServiceKeys._internal();
  factory StorageServiceKeys() => _instance;

  static const String kEmail = 'EMAIL';
  static const String kUid = 'UID';
  static const String kName = 'NAME';
  static const String isLogin = 'IS_LOGIN';
  static const String kUserType = 'USER_TYPE';
}
