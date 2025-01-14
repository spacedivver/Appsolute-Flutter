import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeAppBar extends StatelessWidget {
  final int characterNumber;

  const HomeAppBar({
    super.key,
    required this.characterNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 캐릭터 이미지와 MY 텍스트
          Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: ShapeDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/images/character$characterNumber.png'),
                    fit: BoxFit.cover,
                  ),
                  shape: const CircleBorder(),
                ),
              ),
              const SizedBox(width: 4),
              const Text(
                'MY',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w600,
                  height: 1,
                ),
              ),
            ],
          ),

          // 알림 아이콘
          SizedBox(
            width: 44,
            height: 44,
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                // 알림함 클릭 이벤트 처리
              },
              icon: SvgPicture.asset(
                'assets/icons/notification.svg',
                width: 24,
                height: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
