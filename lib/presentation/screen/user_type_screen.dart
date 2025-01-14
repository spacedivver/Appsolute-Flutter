import 'package:appsolute_android/constants/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login_screen.dart';

class UserTypeScreen extends StatelessWidget {
  const UserTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.blue500,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 253,
              ),
              Image.asset(
                height: 66,
                width: 193,
                'assets/logo/tium_logo.png',
              ),
              const Spacer(),
              Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(() => const LoginScreen(userType: '직원'));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.white1,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        '직원 로그인',
                        style: TextStyle(
                          color: AppTheme.blue900,
                          fontSize: 20,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () =>
                          Get.to(() => const LoginScreen(userType: '관리자')),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.blue900,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        '관리자 로그인',
                        style: TextStyle(
                          color: AppTheme.white1,
                          fontSize: 20,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 70),
            ],
          ),
        ),
      ),
    );
  }
}
