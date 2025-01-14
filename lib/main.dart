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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
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
