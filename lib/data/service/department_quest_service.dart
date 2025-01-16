import 'package:appsolute_android/constants/string_constant.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DepartmentQuestService extends GetxService {
  Future<Map<String, dynamic>> fetchDepartmentQuest(
      DateTime date, String? jwtToken) async {
    final response = await http.get(
      Uri.parse(
          '$serverUrl/department-quest?date=${date.toIso8601String().split('T')[0]}'),
      headers: {
        'Authorization': 'Bearer $jwtToken',
      }, // 날짜 형식: YYYY-MM-DD
    );

    print("Response status: ${response.statusCode}"); // 상태 코드 출력
    print("Response body: ${response.body}");
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch department quest');
    }
  }
}
