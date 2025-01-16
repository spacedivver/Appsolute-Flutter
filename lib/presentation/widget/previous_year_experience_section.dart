import 'package:appsolute_android/presentation/widget/custom_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PreviousYearExperienceSection extends StatefulWidget {
  final int lastYearXP; // 작년 누적 경험치
  final int nextLevelXP; // 다음 레벨에 필요한 경험치

  const PreviousYearExperienceSection({
    super.key,
    required this.lastYearXP,
    required this.nextLevelXP,
  });

  @override
  State<PreviousYearExperienceSection> createState() =>
      _PreviousYearExperienceSectionState();
}

class _PreviousYearExperienceSectionState
    extends State<PreviousYearExperienceSection> {
  bool _isExpanded = false;

  double get progressPercentage =>
      (widget.lastYearXP / widget.nextLevelXP * 100).clamp(0, 100);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFDCEBFF),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Container(
              height: 72,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '전년도 상세 내역',
                    style: TextStyle(
                      color: Color(0xFF0B52AD),
                      fontSize: 20,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SvgPicture.asset(
                    _isExpanded
                        ? "assets/icons/open_arrow.svg"
                        : "assets/icons/close_arrow.svg",
                  ),
                ],
              ),
            ),
          ),
          if (_isExpanded)
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(color: Color(0xFFB5D4FC)),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 21),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 21),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                        height: 36,
                        decoration: ShapeDecoration(
                          color: const Color(0xFFE9ECEF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(999),
                          ),
                        ),
                        child: CustomProgressBar(
                          numerator: widget.lastYearXP,
                          denominator: widget.nextLevelXP,
                          progressColor: const Color(0xFFFF9500),
                        )),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '0%',
                            style: TextStyle(
                              color: Color(0xFFADB5BD),
                              fontSize: 12,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            '50%',
                            style: TextStyle(
                              color: Color(0xFFADB5BD),
                              fontSize: 12,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            '100%',
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
                      child: const Row(
                        children: [
                          Icon(
                            Icons.arrow_upward,
                            color: Color(0xFF1073F4),
                            size: 12,
                          ),
                          SizedBox(width: 4),
                          Text(
                            '‘작년 누적 경험치 / 다음 레벨에 필요한 경험치’ 값이에요',
                            style: TextStyle(
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
            ),
        ],
      ),
    );
  }
}
