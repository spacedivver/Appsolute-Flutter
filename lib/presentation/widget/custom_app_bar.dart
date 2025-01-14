import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String title;

  const CustomAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      alignment: Alignment.center,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Color(0xFF121212),
          fontSize: 22,
          fontFamily: 'Pretendard',
          fontWeight: FontWeight.w700,
          height: 1,
        ),
      ),
    );
  }
}
