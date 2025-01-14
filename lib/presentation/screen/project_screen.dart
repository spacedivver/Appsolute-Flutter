import 'package:flutter/material.dart';
import '../widget/custom_app_bar.dart';
import '../widget/project_item.dart';

class ProjectScreen extends StatelessWidget {
  const ProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          child: CustomScrollView(
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
                      return const Padding(
                        padding: EdgeInsets.only(bottom: 16),
                        child: ProjectItem(
                          title: '전자결재 시스템 프로젝트',
                          content: '페이퍼리스 업무 체계 구축',
                          date: '2025.01.09',
                          xp: 600,
                        ),
                      );
                    },
                    childCount: 10,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
