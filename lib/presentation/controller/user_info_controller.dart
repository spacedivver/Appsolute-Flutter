// file: home_controller.dart
import 'package:get/get.dart';
import '../../data/service/user_service.dart';
import '../../domain/model/user_info.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../data/service/auth_service.dart';
import 'package:appsolute_android/constants/string_constant.dart';

class UserInfoController extends GetxController {
  final UserService _userService = Get.find<UserService>();
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  final Rx<UserInfo?> userInfo = Rx<UserInfo?>(null);
  final RxBool isLoading = true.obs;
  final RxString errorMessage = ''.obs;
  var userId = ''.obs;

  @override
  void onInit() {
    fetchUserInfo();
    super.onInit();
  }

  Future<void> fetchUserInfo() async {
    isLoading.value = true;
    try {
      String? jwtToken = await _storage.read(key: 'jwtToken');
      print('JWT Token: $jwtToken');
      if (jwtToken != null) {
        UserInfo fetchedUserInfo = await _userService.getUserInfo(jwtToken);
        userInfo.value = fetchedUserInfo;
        print('Fetched User Info: ${userInfo.value}');
        userId.value = fetchedUserInfo.userId;
      } else {
        throw Exception('JWT 토큰이 없습니다.');
      }
    } catch (e) {
      print("Error fetching user info: $e");
    } finally {
      isLoading.value = false;
    }
  }

  void saveUserId(String id) {
    userId.value = id;
  }
}
