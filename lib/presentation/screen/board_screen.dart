import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widget/custom_app_bar.dart';
import '../widget/board_item.dart';
import '../controller/board_controller.dart';

class BoardScreen extends StatelessWidget {
  final BoardController boardController = Get.find<BoardController>();

  BoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    boardController.fetchBoards();

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
            if (boardController.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }

            return CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(
                  child: CustomAppBar(title: '게시판'),
                ),
                SliverPadding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final board = boardController.boards[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: BoardItem(
                            title: board.title,
                            content: board.content,
                            date:
                                '${board.createdAt.year}.${board.createdAt.month}.${board.createdAt.day}', // 날짜 형식 조정
                            isNew: board.isNew,
                          ),
                        );
                      },
                      childCount: boardController.boards.length,
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
