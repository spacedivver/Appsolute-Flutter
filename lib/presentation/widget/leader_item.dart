import 'package:flutter/material.dart';

import '../../constants/theme.dart';
import '../controller/leader_quest_controller.dart';

class LeaderItem extends StatelessWidget {
  final String questName;

  final String status;
  final String experienceMessage;

  const LeaderItem({
    super.key,
    required this.questName,
    required this.status,
    required this.experienceMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 21,
        left: 22,
        right: 22,
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
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 74,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 60,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 14, vertical: 6),
                              decoration: ShapeDecoration(
                                color: AppTheme.blue80,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(99),
                                ),
                              ),
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    '리더 부여',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF0F69DE),
                                      fontSize: 16,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w400,
                                      height: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              questName, // 동적으로 바뀌는 부분
                              style: const TextStyle(
                                color: Color(0xFF121212),
                                fontSize: 22,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w700,
                                height: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 14),
                    ],
                  ),
                ),
                const Divider(),
                const SizedBox(height: 11),
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        experienceMessage,
                        style: TextStyle(
                          color: status == 'Min'
                              ? const Color(0xFF70DD02)
                              : status == 'Med'
                                  ? const Color(0xFFFF8A00)
                                  : const Color(0xFFFF3131),
                          fontSize: 16,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w600,
                          height: 1,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 6),
                        decoration: ShapeDecoration(
                          color: status == 'Min'
                              ? const Color(0xFF70DD02)
                              : status == 'Med'
                                  ? const Color(0xFFFF8A00)
                                  : const Color(0xFFFF3131),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              status, // 동적으로 바뀌는 상태
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
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
                ),
              ],
            ),
          ),
          const SizedBox(height: 22),
          Container(
            width: double.infinity,
            height: 40,
            decoration: ShapeDecoration(
              color: const Color(0xFFF8F9FA),
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1, color: Color(0xFFDEE2E6)),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '더보기',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF212529),
                    fontSize: 16,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w500,
                    height: 1,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
