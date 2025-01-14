import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/theme.dart';
import 'user_type_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Get.off(() => const UserTypeScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.blue500,
      body: SafeArea(
        child: Center(
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
            ],
          ),
        ),
      ),
    );
  }
}
