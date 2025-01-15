import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ExperienceSection3 extends StatelessWidget {
  final int evaluationXP;
  final int questXP;
  final int leaderQuestXP;
  final int projectXP;

  const ExperienceSection3({
    super.key,
    required this.evaluationXP,
    required this.questXP,
    required this.leaderQuestXP,
    required this.projectXP,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 21),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '| 획득 상세내역',
                style: TextStyle(
                  color: Color(0xFF393939),
                  fontSize: 18,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 18),
              _buildXPRow('인사평가:', evaluationXP),
              const SizedBox(height: 13),
              _buildXPRow('직무별 퀘스트:', questXP),
              const SizedBox(height: 13),
              _buildXPRow('리더부여 퀘스트:', leaderQuestXP),
              const SizedBox(height: 13),
              _buildXPRow('전사 프로젝트:', projectXP),
              const SizedBox(height: 13),
              const Divider(),
              const SizedBox(height: 13),
              _buildTotalRow(),
            ],
          ),
        ));
  }

  Widget _buildXPRow(String title, int xp) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Color(0xFF343A40),
            fontSize: 16,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          '${xp}XP',
          style: const TextStyle(
            color: Color(0xFF343A40),
            fontSize: 16,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildTotalRow() {
    final totalXP = evaluationXP + questXP + leaderQuestXP + projectXP;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          '총계:',
          style: TextStyle(
            color: Color(0xFF343A40),
            fontSize: 18,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w700,
          ),
        ),
        Row(
          children: [
            Container(
              width: 19,
              height: 19,
              decoration: const ShapeDecoration(
                color: Colors.white,
                shape: CircleBorder(),
              ),
              child: SvgPicture.asset('assets/icons/exp.svg'),
            ),
            const SizedBox(width: 7),
            Text(
              '${totalXP}XP',
              style: const TextStyle(
                color: Color(0xFF212529),
                fontSize: 18,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w700,
                height: 1,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
