import 'package:appsolute_android/constants/theme.dart';
import 'package:appsolute_android/presentation/screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../controller/login_controller.dart';

class LoginScreen extends StatelessWidget {
  final String userType;
  final LoginController controller = Get.put(LoginController());

  LoginScreen({
    super.key,
    required this.userType,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.blue50,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                height: 44,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 29,
                      height: 32,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: SvgPicture.asset(
                          'assets/icons/backarrow_blue.svg',
                        ),
                        onPressed: () => Get.back(),
                      ),
                    ),
                    Text(
                      '$userType 로그인',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: AppTheme.blue500,
                        fontSize: 22,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      width: 29,
                      height: 32,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 54,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 116,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'ID',
                          style: TextStyle(
                            color: Color(0xFF121212),
                            fontSize: 20,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w600,
                            height: 1,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Container(
                          width: double.infinity,
                          height: 56,
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: const BorderSide(color: Color(0xFFE9ECEF)),
                            ),
                          ),
                          child: TextField(
                            onChanged: (value) => controller.setUserId(value),
                            style: const TextStyle(
                              fontSize: 20,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w400,
                            ),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: '아이디를 입력하세요.',
                              hintStyle: TextStyle(
                                color: Color(0xFFADB5BD),
                                fontSize: 20,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w400,
                                height: 1,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Obx(() => controller.isIdError.value
                            ? const Text(
                                '아이디가 옳지 않습니다.',
                                style: TextStyle(
                                  color: Color(0xFFFF2744),
                                  fontSize: 16,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w400,
                                  height: 1,
                                ),
                              )
                            : const SizedBox.shrink()),
                      ],
                    ),
                  ),
                  const SizedBox(height: 36),
                  SizedBox(
                    width: double.infinity,
                    height: 116,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Password',
                          style: TextStyle(
                            color: Color(0xFF121212),
                            fontSize: 20,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w600,
                            height: 1,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Container(
                          width: double.infinity,
                          height: 56,
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: const BorderSide(color: Color(0xFFE9ECEF)),
                            ),
                          ),
                          child: TextField(
                            obscureText: true,
                            onChanged: (value) => controller.setPassword(value),
                            style: const TextStyle(
                              fontSize: 20,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w400,
                            ),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: '비밀번호를 입력하세요.',
                              hintStyle: TextStyle(
                                color: Color(0xFFADB5BD),
                                fontSize: 20,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w400,
                                height: 1,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Obx(() => controller.isPasswordError.value
                            ? const Text(
                                '비밀번호가 옳지 않습니다.',
                                style: TextStyle(
                                  color: Color(0xFFFF2744),
                                  fontSize: 16,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w400,
                                  height: 1,
                                ),
                              )
                            : const SizedBox.shrink()),
                      ],
                    ),
                  ),
                ],
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: Obx(() => ElevatedButton(
                      onPressed: controller.isLoading.value
                          ? null
                          : () => controller.login(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.blue500,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      child: controller.isLoading.value
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text(
                              '확인',
                              style: TextStyle(
                                color: AppTheme.white1,
                                fontSize: 20,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                    )),
              ),
              const SizedBox(
                height: 70,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
