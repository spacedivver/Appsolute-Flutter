import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class YearlyExperienceSection extends StatefulWidget {
  final Map<int, int> yearlyXP;

  const YearlyExperienceSection({
    super.key,
    required this.yearlyXP,
  });

  @override
  State<YearlyExperienceSection> createState() =>
      _YearlyExperienceSectionState();
}

class _YearlyExperienceSectionState extends State<YearlyExperienceSection> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _isExpanded ? null : null,
      decoration: BoxDecoration(
        color: const Color(0xFFDCEBFF),
        border: Border.all(
          color: const Color(0xFFB5D4FC),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 헤더 부분
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
                    '연도별 획득 내역',
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
                  top: BorderSide(
                    color: Color(0xFFB5D4FC),
                  ),
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
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ...widget.yearlyXP.entries.map((entry) => _buildYearRow(
                          entry.key,
                          entry.value,
                          isCurrentYear: entry.key == DateTime.now().year,
                        )),
                    const Divider(),
                    const SizedBox(height: 13),
                    _buildTotalRow(),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildYearRow(int year, int xp, {bool isCurrentYear = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 13),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            isCurrentYear ? '$year년(올해)' : '$year년',
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
      ),
    );
  }

  Widget _buildTotalRow() {
    final totalXP = widget.yearlyXP.values.reduce((sum, xp) => sum + xp);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          '총 누적 경험치:',
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
