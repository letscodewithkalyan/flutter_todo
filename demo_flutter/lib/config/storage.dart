import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Storage {
  static final Storage _instance = Storage._internal();
  factory Storage() => _instance;
  Storage._internal();

  final storage = const FlutterSecureStorage(
      aOptions: AndroidOptions(
    encryptedSharedPreferences: true,
  ));

  String token = '';
}
