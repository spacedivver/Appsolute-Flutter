import 'package:get/get.dart';
import '../../data/service/leader_quest_service.dart';
import '../../domain/model/leader_quest.dart';

class LeaderQuestController extends GetxController {
  final LeaderQuestService _service = Get.find<LeaderQuestService>();
  var leaderQuests = <LeaderQuest>[].obs;
  var isLoading = false.obs;

  Future<void> fetchLeaderQuests(String userId, int month) async {
    isLoading(true);
    try {
      final data = await _service.fetchLeaderQuest(userId, month);

      leaderQuests.assignAll(data); // 올바른 데이터 할당
    } catch (e) {
      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading(false);
    }
  }
}
