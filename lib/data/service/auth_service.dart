import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../constants/string_constant.dart';
import '../../domain/model/login_request.dart';
import '../../domain/model/login_response.dart';

class AuthService extends GetxService {
  final _client = GetConnect();
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<LoginResponse> login(LoginRequest request) async {
    try {
      final response = await _client.post(
        '$serverUrl/users/login',
        request.toJson(),
      );

      print('Login request: ${request.toJson()}');
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final loginResponse = LoginResponse.fromJson(response.body);
        await _storage.write(key: 'jwtToken', value: loginResponse.jwtToken);
        return loginResponse;
      } else {
        throw Exception('로그인 실패');
      }
    } catch (e) {
      print("Error during login: $e");
      rethrow;
    }
  }
}
