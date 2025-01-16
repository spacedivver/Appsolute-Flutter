import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import '../../data/service/department_quest_service.dart';
import '../../domain/model/department_quest.dart';
import '../../domain/model/department_quest_detail.dart';

class DepartmentQuestController extends GetxController {
  final DepartmentQuestService _departmentQuestService =
      Get.find<DepartmentQuestService>();
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  var departmentQuests = <DepartmentQuest>[].obs;
  var selectedQuestDetail = Rxn<DepartmentQuestDetailResponse>();

  Future<void> fetchDepartmentQuest(DateTime date) async {
    try {
      String? jwtToken = await _storage.read(key: 'jwtToken');
      final data =
          await _departmentQuestService.fetchDepartmentQuest(date, jwtToken);
      departmentQuests.clear();
      departmentQuests.add(DepartmentQuest.fromJson(data));
    } catch (e) {
      print("Error fetching department quest: $e");
      departmentQuests.add(DepartmentQuest(
        departmentGroupQuestId: 0,
        departmentQuestType: '',
        maxThreshold: 0,
        mediumThreshold: 0,
        departmentGroupQuestStatus: 'READY',
        mediumPoint: 0,
        maxPoint: 0,
        year: 0,
        month: 0,
        week: 0,
        nowXP: 0,
        departmentName: '정보 없음',
        departmentGroupName: '0',
        note: '정보 없음',
      ));
    }
  }

  Future<void> fetchDepartmentQuestDetail(int departmentGroupQuestId) async {
    try {
      String? jwtToken = await _storage.read(key: 'jwtToken');
      final data = await _departmentQuestService.fetchDepartmentQuestDetail(
          departmentGroupQuestId, jwtToken);
      selectedQuestDetail.value = DepartmentQuestDetailResponse.fromJson(data);
    } catch (e) {
      print("Error fetching department quest detail: $e");
    }
  }
}
