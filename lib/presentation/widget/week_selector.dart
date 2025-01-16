import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeekSelector extends StatelessWidget {
  final List<DateTimeRange> weeks;
  final int selectedWeek;
  final ValueChanged<int> onWeekSelected;

  const WeekSelector({
    super.key,
    required this.weeks,
    required this.selectedWeek,
    required this.onWeekSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 67,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: weeks.asMap().entries.map((entry) {
          int index = entry.key;
          DateTimeRange weekRange = entry.value;
          String weekLabel = "${index + 1} 주차";

          return Expanded(
            child: GestureDetector(
              onTap: () => onWeekSelected(index),
              child: Container(
                height: double.infinity,
                decoration: BoxDecoration(
                  color: selectedWeek == index
                      ? const Color(0xFF073066)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      weekLabel,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: selectedWeek == index
                            ? Colors.white
                            : const Color(0xFF093F86),
                        fontSize: selectedWeek == index ? 18 : 16,
                        fontFamily: 'Pretendard',
                        fontWeight: selectedWeek == index
                            ? FontWeight.w700
                            : FontWeight.w600,
                        height: 1,
                      ),
                    ),
                    if (selectedWeek == index) const SizedBox(height: 7),
                    if (selectedWeek == index)
                      Text(
                        "${DateFormat('MM.dd').format(weekRange.start)} - ${DateFormat('dd').format(weekRange.end)}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xFFDCEBFF),
                          fontSize: 12,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w500,
                          height: 1,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
