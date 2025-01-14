import 'package:flutter/material.dart';
import '../widget/experience_section1.dart';
import '../widget/experience_section2.dart';
import '../widget/home_app_bar.dart';
import '../widget/level_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          // 레벨 섹션
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: LevelSection(
                  levelImage: 'assets/images/level1.png',
                  level: 1,
                  levelName: '꿈틀이 씨앗',
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 32,
                ),
              ),
              SliverToBoxAdapter(
                child: ExperienceSection1(
                  currentXP: 1500,
                  nextLevelXP: 9000,
                  targetLevel: 3,
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 26,
                ),
              ),
              SliverToBoxAdapter(
                child: ExperienceSection2(
                  currentXP: 1500,
                  nextLevelXP: 9000,
                  targetLevel: 3,
                ),
              ),
              // 여기에 추가 콘텐츠 추가
            ],
          ),

          // 앱바를 최상단에 겹치게 배치
          SafeArea(
            child: HomeAppBar(
              characterNumber: 1,
            ),
          ),
        ],
      ),
    );
  }
}
