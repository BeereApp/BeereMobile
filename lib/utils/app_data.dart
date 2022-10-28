import 'package:get_storage/get_storage.dart';

class AppData {
  final _box = GetStorage();

  Future<void> clearStorage() async {
    await _box.erase();
  }

  void storeToken(String token) {
    _box.write('token', token);
  }

  void removeToken() {
    _box.remove('token');
  }

  void storePassword(String password) {
    _box.write('password', password);
  }

  void storePhone(String phone) {
    _box.write('phone', phone);
  }

  String get token => _box.read('token');
  String get password => _box.read('password');
  String get phone => _box.read('phone');
}
