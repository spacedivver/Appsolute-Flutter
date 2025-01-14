import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widget/custom_bottom_nav_bar.dart';
import 'board_screen.dart';
import 'evaluation_screen.dart';
import 'home_screen.dart';
import 'project_screen.dart';
import 'quest_screen.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final RxInt _currentIndex = 0.obs;

  final List<Widget> _screens = [
    const HomeScreen(),
    const QuestScreen(),
    const EvaluationScreen(),
    const ProjectScreen(),
    const BoardScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => _screens[_currentIndex.value]),
      bottomNavigationBar: Obx(
        () => CustomBottomNavBar(
          currentIndex: _currentIndex.value,
          onTap: (index) => _currentIndex.value = index,
        ),
      ),
    );
  }
}
