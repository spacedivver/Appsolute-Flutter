import 'package:flutter/material.dart';
import '../../constants/theme.dart';
import '../widget/experience_section1.dart';
import '../widget/experience_section2.dart';
import '../widget/home_app_bar.dart';
import '../widget/level_section.dart';
import '../widget/experience_section3.dart';
import '../widget/yearly_experience_section.dart';
import '../widget/previous_year_experience_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppTheme.blue50,
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
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 18,
                ),
              ),
              SliverToBoxAdapter(
                child: ExperienceSection3(
                  evaluationXP: 150,
                  questXP: 150,
                  leaderQuestXP: 100,
                  projectXP: 100,
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 32,
                ),
              ),
              SliverToBoxAdapter(
                child: YearlyExperienceSection(
                  yearlyXP: {
                    2025: 500,
                    2024: 400,
                    2023: 350,
                    2022: 250,
                  },
                ),
              ),
              SliverToBoxAdapter(
                  child: PreviousYearExperienceSection(
                lastYearXP: 800, // 작년 누적 경험치
                nextLevelXP: 1000, // 다음 레벨에 필요한 경험치
              )),
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
