import 'package:get/get.dart';
import '../../constants/string_constant.dart';
import '../../domain/model/board.dart';

class BoardService extends GetxService {
  final _client = GetConnect();

  Future<List<Board>> getBoards() async {
    final response = await _client.get('$serverUrl/board');

    if (response.statusCode == 200) {
      List<Board> boards = (response.body as List)
          .map((board) => Board.fromJson(board))
          .toList();
      return boards;
    } else {
      throw Exception('게시판 정보를 가져오는 데 실패했습니다.');
    }
  }
}
