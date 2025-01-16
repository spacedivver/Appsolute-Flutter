import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:appsolute_android/constants/theme.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 37),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(0, '메인 홈', 'home'),
          _buildNavItem(1, '퀘스트', 'quest'),
          _buildNavItem(2, '인사평가', 'evaluation'),
          _buildNavItem(3, '프로젝트', 'project'),
          _buildNavItem(4, '게시판', 'board'),
        ],
      ),
    );
  }

  Widget _buildNavItem(int index, String label, String iconName) {
    final bool isSelected = currentIndex == index;

    return InkWell(
      onTap: () => onTap(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            'assets/icons/nav/${iconName}_${isSelected ? 'focus' : 'unfocus'}.svg',
            width: 72,
            height: 43,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? AppTheme.blue500 : AppTheme.gray4,
              fontSize: 12,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
