import 'package:flutter/material.dart';

class CustomProgressBar extends StatelessWidget {
  final int numerator; // 분자
  final int denominator; // 분모
  final Color progressColor;

  const CustomProgressBar({
    super.key,
    required this.numerator,
    required this.denominator,
    required this.progressColor,
  });

  @override
  Widget build(BuildContext context) {
    final percentage = (numerator / denominator);
    final isOverHalf = percentage >= 0.5;
    final displayText =
        percentage > 1 ? '100%' : '${(percentage * 100).toInt()}%';

    return Stack(
      alignment: Alignment.center,
      children: [
        Row(
          children: [
            Expanded(
              flex: numerator, // 분자를 flex로 사용
              child: Container(
                height: 36,
                decoration: ShapeDecoration(
                  color: progressColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(999),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: denominator - numerator, // 남은 공간을 flex로 사용
              child: Container(
                height: 36,
                decoration: ShapeDecoration(
                  color: Colors.transparent, // 투명색으로 처리
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(999),
                  ),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          left: isOverHalf ? 10 : null,
          right: isOverHalf ? null : 10,
          child: Center(
            child: Text(
              displayText,
              style: TextStyle(
                color: isOverHalf ? Colors.white : progressColor,
                fontSize: 16,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w700,
                height: 1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
