import 'package:get/get.dart';
import '../../constants/string_constant.dart';
import '../../domain/model/project.dart';

class ProjectService extends GetxService {
  final _client = GetConnect();

  Future<List<Project>> getUserProjects(String userId) async {
    final response = await _client.get('$serverUrl/project/user/$userId');

    if (response.statusCode == 200) {
      List<Project> projects = (response.body as List)
          .map((project) => Project.fromJson(project))
          .toList();
      return projects;
    } else {
      throw Exception('Failed to fetch projects');
    }
  }
}
