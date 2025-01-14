import 'package:flutter/material.dart';
import '../widget/custom_app_bar.dart';
import '../widget/board_item.dart';

class BoardScreen extends StatelessWidget {
  const BoardScreen({super.key});

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
              // 앱바
              const SliverToBoxAdapter(
                child: CustomAppBar(title: '게시판'),
              ),
              SliverPadding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return const Padding(
                        padding: EdgeInsets.only(bottom: 16),
                        child: BoardItem(
                          title: '상반기 인사발령 안내',
                          content: '2025년 상반기 정기 인사발령 안내',
                          date: '2025.01.04',
                          isNew: true,
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
