import 'package:flutter/material.dart';

class QuestScreen extends StatelessWidget {
  const QuestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          '퀘스트 화면',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
