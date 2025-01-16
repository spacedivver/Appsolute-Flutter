import 'package:appsolute_android/constants/string_constant.dart';
import 'package:appsolute_android/data/service/board_service.dart';
import 'package:appsolute_android/data/service/department_quest_service.dart';
import 'package:appsolute_android/data/service/evaluation_service.dart';
import 'package:appsolute_android/data/service/project_service.dart';
import 'package:appsolute_android/data/service/user_service.dart';
import 'package:appsolute_android/presentation/controller/board_controller.dart';
import 'package:appsolute_android/presentation/controller/department_quest_controller.dart';
import 'package:appsolute_android/presentation/controller/evaluation_controller.dart';
import 'package:appsolute_android/presentation/controller/project_controller.dart';
import 'package:appsolute_android/presentation/controller/user_info_controller.dart';
import 'package:get/get.dart';
import '../controller/login_controller.dart';
import '../../data/service/auth_service.dart';

class UserInfoBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(UserService());
    Get.put(UserInfoController());
    Get.put(ProjectService());
    Get.put(ProjectController());
    Get.put(BoardService());
    Get.put(BoardController());
    Get.put(EvaluationService());
    Get.put(EvaluationController());
    Get.put(DepartmentQuestService());
    Get.put(DepartmentQuestController());
  }
}
