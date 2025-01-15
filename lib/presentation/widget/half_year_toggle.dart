import 'package:flutter/material.dart';

enum HalfYear { first, second }

class HalfYearToggle extends StatelessWidget {
  final HalfYear selectedHalf;
  final Function(HalfYear) onHalfYearChanged;

  const HalfYearToggle({
    super.key,
    required this.selectedHalf,
    required this.onHalfYearChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => onHalfYearChanged(HalfYear.first),
            child: Container(
              height: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: ShapeDecoration(
                color: selectedHalf == HalfYear.first
                    ? const Color(0xFF343A40)
                    : Colors.white,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 3, color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Center(
                child: Text(
                  '상반기',
                  style: TextStyle(
                    color: selectedHalf == HalfYear.first
                        ? Colors.white
                        : const Color(0xFF343A40),
                    fontSize: 15,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w600,
                    height: 1,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => onHalfYearChanged(HalfYear.second),
            child: Container(
              height: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: ShapeDecoration(
                color: selectedHalf == HalfYear.second
                    ? const Color(0xFF343A40)
                    : Colors.white,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 3, color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Center(
                child: Text(
                  '하반기',
                  style: TextStyle(
                    color: selectedHalf == HalfYear.second
                        ? Colors.white
                        : const Color(0xFF343A40),
                    fontSize: 15,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w600,
                    height: 1,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
