import 'package:get/get.dart';
import '../../data/service/project_service.dart';
import '../../domain/model/project.dart';

class ProjectController extends GetxController {
  final ProjectService _projectService = Get.find<ProjectService>();
  var projects = <Project>[].obs;
  var isLoading = true.obs;

  Future<void> fetchUserProjects(String userId) async {
    isLoading.value = true;
    try {
      if (userId.isEmpty) {
        throw Exception('userId is empty');
      }
      projects.value = await _projectService.getUserProjects(userId);
    } catch (e) {
      print("Error fetching projects: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
