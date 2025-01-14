import 'package:flutter/material.dart';

class QuestItem extends StatelessWidget {
  final String title;
  final dynamic role;
  final bool leader;
  final int grade;

  const QuestItem({
    Key? key,
    required this.role,
    required this.title,
    required this.grade,
    required this.leader,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card( // Use Card for a Material-style container
      clipBehavior: Clip.antiAlias, // Clip content to avoid overflow
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell( // Wrap with InkWell for tap functionality
        onTap: () {
          // Handle tap action here
        },
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              const SizedBox(height: 8),
              // Remove Spacer here
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    leader ? 'assets/images/leader.png' : 'assets/images/role.png',
                    width: 40,
                    height: 40,
                  ),
                  Image.asset(
                    _getGradeImage(grade),
                    width: 40,
                    height: 40,
                  ),
                ],
              ),
              const SizedBox(height: 16), // Add spacing before the button
              ElevatedButton( // Use ElevatedButton for Material-style button
                onPressed: () {
                  _showBottomSheet(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: const Size.fromHeight(40), // Set button height
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  "더보기",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getGradeImage(int grade) {
    switch (grade) {
      case 1:
        return 'assets/images/max.png';
      case 2:
        return 'assets/images/mid.png';
      case 3:
        return 'assets/images/min.png';
      case 4:
        return 'assets/images/beforebegin.png';
      default:
        return 'assets/images/role.png'; // Default role image
    }
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allow the bottom sheet to be full screen
      builder: (BuildContext context) {
        return Container(
          margin: const EdgeInsets.only(top: 54), // Add top margin
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              // Add your bottom sheet content here
              const SizedBox(height: 20),
              const Text('This is the bottom sheet content'),
              // ... more content
            ],
          ),
        );
      },
    );
  }
}
