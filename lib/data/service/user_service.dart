import 'package:get/get.dart';
import '../../domain/model/user_info.dart';
import '../../constants/string_constant.dart';

class UserService extends GetxService {
  final _client = GetConnect();

  Future<UserInfo> getUserInfo(String jwtToken) async {
    final response = await _client.get(
      '$serverUrl/users',
      headers: {
        'Authorization': 'Bearer $jwtToken',
      },
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      return UserInfo.fromJson(response.body);
    } else {
      throw Exception('사용자 정보 가져오기 실패');
    }
  }
}
