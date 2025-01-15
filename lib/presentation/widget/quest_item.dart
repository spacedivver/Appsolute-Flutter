import 'package:flutter/material.dart';

class QuestItem extends StatelessWidget {
  final String title;
  final dynamic role;
  final bool leader;
  final int grade;
  final VoidCallback onTap;

  const QuestItem({
    Key? key,
    required this.role,
    required this.title,
    required this.grade,
    required this.leader,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 16, bottom: 8),
            child: Text(
              '1주차',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Card(
            clipBehavior: Clip.antiAlias,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: InkWell(
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Leader Image
                    Image.asset(
                      leader
                          ? 'assets/images/leader.png'
                          : 'assets/images/role.png',
                      width: 40,
                      height: 40,
                    ),

                    // Title with spacing
                    const SizedBox(height: 10),
                    Text(
                      title,
                      style: const TextStyle(
                        color: Color(0xFF121212),
                        fontSize: 20,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    // Divider line
                    const SizedBox(height: 14),
                    Image.asset(
                      'assets/images/line.png',
                      width: 309,
                      fit: BoxFit.fitWidth,
                    ),

                    // Grade Image
                    const SizedBox(height: 11),
                    Image.asset(
                      _getGradeImage(grade),
                      width: 309,
                      height: 26,
                      fit: BoxFit.contain,
                    ),

                    // More Button
                    const SizedBox(height: 22),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          _showBottomSheet(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFDEE2E6),
                          minimumSize: const Size.fromHeight(40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          "더보기",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getGradeImage(int grade) {
    switch (grade) {
      case 1:
        return 'assets/images/max.png';
      case 2:
        return 'assets/images/mid.png';
      case 3:
        return 'assets/images/min.png';
      case 4:
        return 'assets/images/beforebegin.png';
      default:
        return 'assets/images/role.png';
    }
  }

  void _showBottomSheet(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    final double topPadding = leader ? 54.0 : 207.0;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      constraints: BoxConstraints(
        maxHeight: screenHeight - topPadding,
        maxWidth: screenWidth,
      ),
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Stack(
          children: [
            Positioned(
              top: topPadding,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                width: screenWidth,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: leader
                    ? _buildLeaderBottomSheet(context)
                    : _buildMemberBottomSheet(context),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildMemberBottomSheet(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 21, left: 22, right: 22, bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            leader ? 'assets/images/leader.png' : 'assets/images/role.png',
            width: 100,
            height: 100,
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            '퀘스트 달성 내용',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F6F8),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        height: 8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.red,
                        ),
                      ),
                      const Positioned(
                        right: 0,
                        child: Column(
                          children: [
                            Text(
                              'Max',
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text('4회'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              const Text(
                '획득한 경험치',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.amber[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      '/images/coin.png',
                      width: 16,
                      height: 16,
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      '100XP',
                      style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              const Text(
                '비고',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 16),
              Text(
                '${grade}회',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              minimumSize: const Size.fromHeight(48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              "닫기",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildLeaderBottomSheet(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Image.asset(
              leader ? 'assets/images/leader.png' : 'assets/images/role.png',
              width: 100,
              height: 100,
            ),
            const SizedBox(height: 24),

            // 퀘스트 난이도 섹션
            const Text(
              '퀘스트 달성 난이도',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF5F6F8),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              child: Row(
                children: [
                  const Text('0'),
                  Expanded(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: 8,
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFFFF9500),
                                Color(0xFFD9D9D9),
                              ],
                              stops: [0.84, 0.84], // 4.3/5.1 ≈ 0.84
                            ),
                          ),
                        ),
                        const Positioned(
                          child: Column(
                            children: [
                              Text(
                                'Mid',
                                style: TextStyle(
                                  color: Color(0xFFFF9500),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text('4.3'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Text('5.1'),
                ],
              ),
            ),

            // 획득한 경험치
            const SizedBox(height: 24),
            Row(
              children: [
                const Text(
                  '획득한 경험치',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.amber[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        '/images/coin.png',
                        width: 16,
                        height: 16,
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        '50XP',
                        style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // 생산성
            const SizedBox(height: 24),
            const Row(
              children: [
                Text(
                  '생산성',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  '4.762',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),

            // 재무내역
            const SizedBox(height: 24),
            const Text(
              '1월 3주차 일별 재무내역',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F6F8),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  // 날짜 선택 행
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildDateButton('15일', true),
                        _buildDateButton('16일', false),
                        _buildDateButton('17일', false),
                        _buildDateButton('18일', false),
                        _buildDateButton('19일', false),
                        _buildDateButton('20일', false),
                        _buildDateButton('21일', false),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  // 수익/지출 바 차트
                  Column(
                    children: [
                      _buildBarChart('수익', 10, Colors.red),
                      const SizedBox(height: 8),
                      _buildBarChart('지출', 8, Colors.blue),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // 지출 상세내역 테이블
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            '< 지출 상세내역 >',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Table(
                          border: TableBorder.all(
                            color: Colors.grey.shade300,
                          ),
                          children: const [
                            TableRow(
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Center(child: Text('지출 항목')),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Center(child: Text('금액')),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(48),
              ),
              child: const Text("닫기"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDateButton(String date, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? const Color(0xFF073066) : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          date,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}

Widget _buildBarChart(String label, int value, Color color) {
  return Row(
    children: [
      SizedBox(
        width: 40,
        child: Text(
          label,
          style: const TextStyle(fontSize: 12),
        ),
      ),
      Expanded(
        child: Container(
          height: 24,
          decoration: BoxDecoration(
            color: color.withOpacity(0.3),
            borderRadius: BorderRadius.circular(4),
          ),
          child: FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: value / 10,
            child: Container(
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(4),
              ),
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 8),
              child: Text(
                value.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
