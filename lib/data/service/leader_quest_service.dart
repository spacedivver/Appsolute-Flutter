import 'dart:convert'; // jsonDecode 사용을 위해

import 'package:appsolute_android/constants/string_constant.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../domain/model/leader_quest.dart'; // LeaderQuest 모델 임포트

class LeaderQuestService extends GetxService {
  // API 요청 예시
  Future<List<LeaderQuest>> fetchLeaderQuest(String userId, int month) async {
    final response = await http.get(
        Uri.parse('$serverUrl/le-Leader-board?userId=$userId&month=$month'));
    print(response.body);
    if (response.statusCode == 200) {
      try {
        // 응답을 바이트 배열로 받아서 UTF-8로 디코딩
        String decodedResponse = utf8.decode(response.bodyBytes);

        // JSON 데이터를 파싱
        final List<dynamic> jsonData = json.decode(decodedResponse);

        // JSON 데이터를 모델로 변환하여 사용
        return jsonData.map((data) => LeaderQuest.fromJson(data)).toList();
      } catch (e) {
        throw Exception('Failed to decode response: $e');
      }
    } else {
      throw Exception('Failed to load leader quests');
    }
  }
}
