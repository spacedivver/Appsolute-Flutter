import 'package:appsolute_android/constants/string_constant.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../domain/model/evaluation.dart';

class EvaluationService extends GetxService {
  Future<Evaluation> fetchEvaluation(
      int year, String periodType, String jwtToken) async {
    final response = await http.get(
      Uri.parse('$serverUrl/evaluation?year=$year&periodType=$periodType'),
      headers: {
        'Authorization': 'Bearer $jwtToken',
      },
    );

    print("Response status: ${response.statusCode}"); // 상태 코드 출력
    print("Response body: ${response.body}");

    if (response.statusCode == 200) {
      return Evaluation.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to fetch evaluation');
    }
  }
}
