import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginRepository {
  static String mainUrl = "https://demo.treblle.com/api/v1/";
  var loginUrl = "$mainUrl/auth/login ";

  final FlutterSecureStorage storage = const FlutterSecureStorage();
  final Dio _dio = Dio();

  Future<bool> hasToken() async {
    var value = await storage.read(key: 'token');

    if (value != null) {
      return true;
    } else {
      return false;
    }
  }

  //menulis token
  Future<void> persistToken(String token) async {
    await storage.write(key: 'token', value: token);
  }

  Future<void> deleteToken() async {
    storage.delete(key: 'token');
    storage.deleteAll();
  }

  Future<String> login(String email, String password) async {
    _dio.options.headers['authorization'] =
        'Bearer lsGPLl4k6Vc4J0VhnFaMBqetNtn1ofsB';
    _dio.options.headers['Content-Type'] = 'application/json';

    Response response =
        await _dio.post(loginUrl, data: {"email": email, "password": password});

    return response.data;
  }
}
