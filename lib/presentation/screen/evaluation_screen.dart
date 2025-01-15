import 'package:flutter/material.dart';
import '../widget/year_dropdown_button.dart';
import '../widget/half_year_toggle.dart';
import '../widget/evaluation_grade_section.dart';

class EvaluationScreen extends StatefulWidget {
  const EvaluationScreen({super.key});

  @override
  State<EvaluationScreen> createState() => _EvaluationScreenState();
}

class _EvaluationScreenState extends State<EvaluationScreen> {
  String selectedYear = '2025년';
  HalfYear selectedHalf = HalfYear.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFB5D4FC),
            Color(0xFFE7F1FE),
          ],
        ),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 32, left: 20, right: 20),
                child: SizedBox(
                  height: 38,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      YearDropdownButton(
                        selectedYear: selectedYear,
                        onYearChanged: (year) {
                          setState(() {
                            selectedYear = year;
                          });
                        },
                      ),
                      const SizedBox(width: 10),
                      HalfYearToggle(
                        selectedHalf: selectedHalf,
                        onHalfYearChanged: (half) {
                          setState(() {
                            selectedHalf = half;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 28),
              const EvaluationGradeSection(
                grade: '골드',
                experiencePoints: 3600,
                characterImageUrl: 'https://via.placeholder.com/61x61',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
