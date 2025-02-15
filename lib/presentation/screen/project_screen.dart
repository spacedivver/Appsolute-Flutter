import 'package:appsolute_android/presentation/controller/user_info_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widget/custom_app_bar.dart';
import '../widget/project_item.dart';
import '../controller/project_controller.dart';

class ProjectScreen extends StatelessWidget {
  final ProjectController projectController = Get.find<ProjectController>();
  final UserInfoController userInfoController = Get.find<UserInfoController>();

  ProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String userId = userInfoController.userId.value;

    projectController.fetchUserProjects(userId);

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFB5D4FC),
            Color(0xFFE7F1FE),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Obx(() {
            if (projectController.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }

            return CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(
                  child: CustomAppBar(title: '전사 프로젝트 내역'),
                ),
                SliverPadding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final project = projectController.projects[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: ProjectItem(
                            title: project.projectName,
                            content: project.note,
                            date:
                                '${project.month}월 ${project.day}일', // 날짜 형식 조정
                            xp: project.grantedPoint,
                          ),
                        );
                      },
                      childCount: projectController.projects.length,
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
