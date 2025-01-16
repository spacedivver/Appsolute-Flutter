import 'package:get/get.dart';
import '../../data/service/auth_service.dart';
import '../../domain/model/login_request.dart';
import '../binding/user_info_binding.dart';
import '../screen/main_screen.dart';
import '../controller/user_info_controller.dart';

class LoginController extends GetxController {
  final AuthService _authService = Get.find<AuthService>();

  final RxString userId = ''.obs;
  final RxString password = ''.obs;
  final RxBool isLoading = false.obs;
  final RxBool isIdError = false.obs;
  final RxBool isPasswordError = false.obs;

  void setUserId(String value) {
    userId.value = value;
    isIdError.value = false;
  }

  void setPassword(String value) {
    password.value = value;
    isPasswordError.value = false;
  }

  Future<void> login() async {
    if (userId.value.isEmpty || password.value.isEmpty) {
      if (userId.value.isEmpty) isIdError.value = true;
      if (password.value.isEmpty) isPasswordError.value = true;
      return;
    }

    isLoading.value = true;
    try {
      final request = LoginRequest(
        userId: userId.value,
        password: password.value,
      );

      print('Attempting to login with userId: ${userId.value}');

      final response = await _authService.login(request);

      print('Login successful: ${response.jwtToken}');

      Get.offAll(() => MainScreen(), binding: UserInfoBinding());
    } catch (e) {
      print("Login error: $e");
      isIdError.value = true;
      isPasswordError.value = true;
    } finally {
      isLoading.value = false;
    }
  }
}
