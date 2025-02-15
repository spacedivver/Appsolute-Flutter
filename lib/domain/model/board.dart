class Board {
  final int boardId;
  final String title;
  final String content;
  final DateTime createdAt;

  Board({
    required this.boardId,
    required this.title,
    required this.content,
    required this.createdAt,
  });

  factory Board.fromJson(Map<String, dynamic> json) {
    return Board(
      boardId: json['boardId'],
      title: json['title'],
      content: json['content'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  bool get isNew {
    final now = DateTime.now();
    final difference = now.difference(createdAt);
    return difference.inDays <= 7; // 일주일 이내인지 확인
  }
}
