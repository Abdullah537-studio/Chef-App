import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CacheHelper {
  // SecureStorageHelper
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  // لا حاجة لتحضير مسبق، حيث أن FlutterSecureStorage يتعامل مع التخزين مباشرة
  // Future<void> init() async {
  // }

  Future<void> saveData({required String key, required String value}) async {
    await _storage.write(key: key, value: value);
  }

  Future<String?> getData({required String key}) async {
    return await _storage.read(key: key);
  }

  Future<void> removeData({required String key}) async {
    await _storage.delete(key: key);
  }

  Future<bool> containsKey({required String key}) async {
    String? value = await _storage.read(key: key);
    return value != null;
  }

  Future<void> clearData() async {
    await _storage.deleteAll();
  }

  // final String _cachedCode = "cachedCode";

  // Future<String> getCachedLanguage() async {
  //   String? code = await _storage.read(key: _cachedCode);
  //   return code ?? 'ar'; // القيمة الافتراضية
  // }

  // Future<void> cacheLanguage(String code) async {
  //   await _storage.write(key: _cachedCode, value: code);
  // }
}
