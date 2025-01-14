import 'package:flutter/material.dart';

class EvaluationScreen extends StatelessWidget {
  const EvaluationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          '인사평가 화면',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
