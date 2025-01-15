import 'package:flutter/material.dart';

class EvaluationGradeSection extends StatelessWidget {
  final String grade;
  final int experiencePoints;
  final String characterImageUrl;

  const EvaluationGradeSection({
    super.key,
    required this.grade,
    required this.experiencePoints,
    required this.characterImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 353,
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
          Container(
            width: 86,
            height: 86,
            padding: const EdgeInsets.all(7.17),
            decoration: ShapeDecoration(
              color: const Color(0xFF073066),
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 4, color: Color(0xFFFED801)),
                borderRadius: BorderRadius.circular(894.94),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 66,
                  height: 66,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 2.87,
                        top: 2.87,
                        child: Container(
                          width: 61.22,
                          height: 61.22,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(characterImageUrl),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 31.04,
                        top: 12.04,
                        child: Opacity(
                          opacity: 0.60,
                          child: Transform(
                            transform: Matrix4.identity()
                              ..translate(0.0, 0.0)
                              ..rotateZ(1.05),
                            child: const SizedBox(
                              width: 15.64,
                              height: 23.03,
                              child: Stack(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '나의 인사평가 등급: $grade',
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
                '획득 경험치: ${experiencePoints}PX',
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
