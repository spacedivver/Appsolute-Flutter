import 'package:appsolute_android/presentation/binding/login_binding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'presentation/screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

void unfocusKeyboard() async {
  FocusManager.instance.primaryFocus?.unfocus();

  await Future.delayed(const Duration(milliseconds: 100));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        fontFamily: 'Pretendard',
        useMaterial3: true,
      ),
      initialBinding: LoginBinding(),
      builder: (context, child) {
        return GestureDetector(
          onTap: unfocusKeyboard,
          child: child!,
        );
      },
      defaultTransition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 200),
      home: const SplashScreen(),
    );
  }
}
