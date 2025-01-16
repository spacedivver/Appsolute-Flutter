// file: evaluation_controller.dart
import 'package:appsolute_android/data/service/evaluation_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class EvaluationController extends GetxController {
  final EvaluationService _evaluationService = Get.find<EvaluationService>();
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  var gradeName = ''.obs;
  var experiencePoints = 0.obs;

  Future<void> fetchEvaluation(String year, String periodType) async {
    try {
      String? jwtToken = await _storage.read(key: 'jwtToken');
      if (jwtToken == null) {
        throw Exception("JWT token not found");
      }
      final evaluation = await _evaluationService.fetchEvaluation(
          int.parse(year), periodType, jwtToken);
      gradeName.value = evaluation.gradeName;
      experiencePoints.value = evaluation.xp;
    } catch (e) {
      print("Error fetching evaluation: $e");
      gradeName.value = '';
      experiencePoints.value = 0;
    }
  }
}
