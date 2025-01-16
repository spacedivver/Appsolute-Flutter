import 'package:flutter/material.dart';

class YearMonthSelector extends StatelessWidget {
  final String yearMonth;
  final VoidCallback onPreviousMonth;
  final VoidCallback onNextMonth;
  final VoidCallback onSelectYearMonth;

  const YearMonthSelector({
    super.key,
    required this.yearMonth,
    required this.onPreviousMonth,
    required this.onNextMonth,
    required this.onSelectYearMonth,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: onSelectYearMonth,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: onPreviousMonth,
              icon: Image.asset(
                'assets/images/left_arrow.png',
                width: 24,
                height: 24,
              ),
            ),
            Text(
              yearMonth,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'Pretendard',
                fontSize: 30,
                fontWeight: FontWeight.w700,
                height: 1,
              ),
            ),
            IconButton(
              onPressed: onNextMonth,
              icon: Image.asset(
                'assets/images/right_arrow.png',
                width: 24,
                height: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
