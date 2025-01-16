import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/theme.dart';
import 'custom_progress_bar.dart';

class ExperienceSection1 extends StatelessWidget {
  final int currentXP;
  final int nextLevelXP;
  final int targetLevel;

  const ExperienceSection1({
    super.key,
    required this.currentXP,
    required this.nextLevelXP,
    required this.targetLevel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '총 누적 경험치:',
                  style: TextStyle(
                    color: Color(0xFF212529),
                    fontSize: 20,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w700,
                    height: 1,
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: 22,
                      height: 22,
                      decoration: const ShapeDecoration(
                        color: Colors.white,
                        shape: CircleBorder(),
                      ),
                      child: SvgPicture.asset('assets/icons/exp.svg'),
                    ),
                    const SizedBox(width: 7),
                    Text(
                      '${currentXP}XP',
                      style: const TextStyle(
                        color: Color(0xFF212529),
                        fontSize: 20,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w700,
                        height: 1,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 18),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 21),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              child: Column(
                children: [
                  // 프로그레스 바
                  Container(
                      height: 36,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFE9ECEF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(999),
                        ),
                      ),
                      child: CustomProgressBar(
                          numerator: currentXP,
                          denominator: nextLevelXP,
                          progressColor: AppTheme.blue500)),

                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '0XP',
                          style: TextStyle(
                            color: Color(0xFFADB5BD),
                            fontSize: 12,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          '4500XP',
                          style: TextStyle(
                            color: Color(0xFFADB5BD),
                            fontSize: 12,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          '9000XP',
                          style: TextStyle(
                            color: Color(0xFFADB5BD),
                            fontSize: 12,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(8),
                    decoration: ShapeDecoration(
                      color: const Color(0xFFDCEBFF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.arrow_upward,
                          color: Color(0xFF1073F4),
                          size: 12,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Lv.$targetLevel까지 ${nextLevelXP - currentXP}XP 남았어요!',
                          style: const TextStyle(
                            color: Color(0xFF1073F4),
                            fontSize: 12,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w600,
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
