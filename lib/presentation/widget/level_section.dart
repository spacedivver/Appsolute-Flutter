import 'package:flutter/material.dart';

class LevelSection extends StatelessWidget {
  final String levelImage;
  final int level;
  final String levelName;

  const LevelSection({
    super.key,
    required this.levelImage,
    required this.level,
    required this.levelName,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 레벨 배경 이미지
        Container(
          height: 395,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(28),
              bottomRight: Radius.circular(28),
            ),
            image: DecorationImage(
              image: AssetImage(levelImage),
              fit: BoxFit.fitWidth,
            ),
          ),
        ),

        // 레벨 정보 컨테이너
        Positioned(
          left: 20,
          right: 20,
          bottom: 20,
          child: Container(
            height: 64,
            padding: const EdgeInsets.only(
              top: 16,
              left: 22,
              right: 20,
              bottom: 16,
            ),
            decoration: ShapeDecoration(
              color: const Color(0xFF1073F4),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Lv.$level $levelName',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w700,
                    height: 1,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 10,
                  ),
                  decoration: ShapeDecoration(
                    color: const Color(0xFF408FF6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    '레벨 가이드',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w600,
                      height: 1,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
