import 'package:get/get.dart';
import '../../data/service/board_service.dart';
import '../../domain/model/board.dart';

class BoardController extends GetxController {
  final BoardService _boardService = Get.find<BoardService>();
  var boards = <Board>[].obs;
  var isLoading = true.obs;

  Future<void> fetchBoards() async {
    isLoading.value = true;
    try {
      boards.value = await _boardService.getBoards();
    } catch (e) {
      print("Error fetching boards: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
