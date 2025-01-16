import 'package:flutter/material.dart';

class EvaluationGradeSection extends StatelessWidget {
  final String grade;
  final int experiencePoints;

  const EvaluationGradeSection({
    super.key,
    required this.grade,
    required this.experiencePoints,
  });

  @override
  Widget build(BuildContext context) {
    String gradeName;
    switch (grade) {
      case 'S':
        gradeName = '플래티넘';
        break;
      case 'A':
        gradeName = '다이아';
        break;
      case 'B':
        gradeName = '골드';
        break;
      case 'C':
        gradeName = '실버';
        break;
      case 'D':
        gradeName = '브론즈';
        break;
      default:
        gradeName = '정보가 없습니다.'; // 기본값
    }
    return Container(
      width: double.infinity,
      height: 195,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: const Color(0xFF1073F4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          grade.isEmpty
              ? const SizedBox(
                  width: 86,
                  height: 86,
                )
              : SizedBox(
                  width: 86,
                  height: 86,
                  child: Image.asset(
                    'assets/images/big$grade.png', // grade에 따라 이미지 로드
                    width: 86,
                    height: 86,
                    fit: BoxFit.contain,
                  ),
                ),
          const SizedBox(height: 18),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '나의 인사평가 등급 : $gradeName',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                  height: 1,
                ),
              ),
              const SizedBox(height: 11),
              Text(
                '획득 경험치: ${experiencePoints}XP',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w400,
                  height: 1,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
