import 'package:flutter/material.dart';

class ProjectItem extends StatelessWidget {
  final String title;
  final String content;
  final String date;
  final int xp;

  const ProjectItem({
    super.key,
    required this.title,
    required this.content,
    required this.date,
    required this.xp,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 161,
      padding: const EdgeInsets.only(
        top: 24,
        left: 24,
        right: 24,
        bottom: 22,
      ),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: const ShapeDecoration(
                      color: Color(0xFF408FF6),
                      shape: OvalBorder(),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    title,
                    style: const TextStyle(
                      color: Color(0xFF121212),
                      fontSize: 20,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w700,
                      height: 1,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                content,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Color(0xFF495057),
                  fontSize: 16,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w500,
                  height: 1.50,
                ),
              ),
            ],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Opacity(
                opacity: 0.80,
                child: Text(
                  date,
                  style: const TextStyle(
                    color: Color(0xFF868E96),
                    fontSize: 17,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w500,
                    height: 1,
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                decoration: ShapeDecoration(
                  color: const Color(0xFFFFF3D4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 15,
                      height: 15,
                      decoration: const ShapeDecoration(
                        color: Color(0xFFFFA801),
                        shape: CircleBorder(),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      '${xp}XP 획득',
                      style: const TextStyle(
                        color: Color(0xFF343A40),
                        fontSize: 14,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w700,
                        height: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
