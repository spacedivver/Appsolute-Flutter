import 'package:appsolute_android/constants/string_constant.dart';
import 'package:appsolute_android/data/service/user_service.dart';
import 'package:appsolute_android/presentation/controller/user_info_controller.dart';
import 'package:get/get.dart';
import '../controller/login_controller.dart';
import '../../data/service/auth_service.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AuthService());
    Get.put(LoginController());
  }
}
