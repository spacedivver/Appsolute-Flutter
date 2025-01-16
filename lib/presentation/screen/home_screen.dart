// file: home_screen.dart
import 'package:appsolute_android/presentation/controller/user_info_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/string_constant.dart';
import '../../constants/theme.dart';
import '../../domain/model/user_info.dart';
import '../widget/experience_section1.dart';
import '../widget/experience_section2.dart';
import '../widget/home_app_bar.dart';
import '../widget/level_section.dart';
import '../widget/experience_section3.dart';
import '../widget/previous_year_experience_section.dart';
import '../widget/yearly_experience_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final UserInfoController controller = Get.find<UserInfoController>();

    return Scaffold(
      backgroundColor: AppTheme.blue50,
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.errorMessage.isNotEmpty) {
          return Center(child: Text(controller.errorMessage.value));
        }

        final userInfo = controller.userInfo.value;
        if (userInfo == null) {
          return const Center(child: Text('No user data available.'));
        }
        final levelId = controller.getLevelId(userInfo.levelName);
        final requiredPoint = controller.getRequiredPoint(userInfo.levelName);

        return Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Stack(
                    children: [
                      LevelSection(
                        levelImage: 'assets/images/level$levelId.png',
                        level: levelId,
                        levelName: levelId == 1
                            ? '꿈틀이 씨앗'
                            : levelId == 2
                                ? '자라나는 새싹'
                                : levelId == 3
                                    ? '쑥쑥 잎사귀'
                                    : levelId == 4
                                        ? '푸룻푸룻 초목'
                                        : levelId == 5
                                            ? '우뚝 나무'
                                            : '만개 꽃나무',
                      ),
                      const HomeAppBar(
                        characterNumber:
                            1, // Example static value, update if needed
                      ),
                    ],
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(height: 32),
                ),
                SliverToBoxAdapter(
                  child: ExperienceSection1(
                    currentXP:
                        userInfo.thisYearTotalXP + userInfo.lastYearTotalXP,
                    nextLevelXP: userInfo.thisYearTotalXP +
                        userInfo.lastYearTotalXP +
                        userInfo.nextLevelRemainXP,
                    targetLevel:
                        levelId + 1, // Compute from level info dynamically
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(height: 26),
                ),
                SliverToBoxAdapter(
                  child: ExperienceSection2(
                    thisYearTotalXP: userInfo.thisYearTotalXP,
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(height: 18),
                ),
                SliverToBoxAdapter(
                  child: ExperienceSection3(
                    evaluationXP: userInfo.thisEvaluationXP,
                    questXP: userInfo.thisDepartmentGroupXP,
                    leaderQuestXP: userInfo.thisLeQuestXP,
                    projectXP: userInfo.thisProjectXP,
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(height: 32),
                ),
                SliverToBoxAdapter(
                  child: YearlyExperienceSection(
                    yearlyXP: {
                      2025: userInfo.thisYearTotalXP,
                      2024: userInfo.lastYearTotalXP,
                    },
                  ),
                ),
                SliverToBoxAdapter(
                  child: PreviousYearExperienceSection(
                    lastYearXP: userInfo.lastYearTotalXP,
                    nextLevelXP: userInfo.nextLevelRemainXP,
                  ),
                ),
              ],
            ),
          ],
        );
      }),
    );
  }
}
