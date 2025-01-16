// file: evaluation_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/evaluation_controller.dart';
import '../widget/year_dropdown_button.dart';
import '../widget/half_year_toggle.dart';
import '../widget/evaluation_grade_section.dart';

class EvaluationScreen extends StatefulWidget {
  const EvaluationScreen({super.key});

  @override
  State<EvaluationScreen> createState() => _EvaluationScreenState();
}

class _EvaluationScreenState extends State<EvaluationScreen> {
  String selectedYear = '2025';
  HalfYear selectedHalf = HalfYear.first;

  late EvaluationController evaluationController;

  @override
  void initState() {
    super.initState();
    evaluationController = Get.put(EvaluationController());
    _fetchEvaluationData();
  }

  void _fetchEvaluationData() {
    final periodType =
        selectedHalf == HalfYear.first ? "FIRST_HALF" : "SECOND_HALF";
    evaluationController.fetchEvaluation(selectedYear, periodType);
  }

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
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: SizedBox(
                    height: 38,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        YearDropdownButton(
                          selectedYear: "$selectedYear년",
                          onYearChanged: (year) {
                            setState(() {
                              selectedYear = year.replaceAll("년", "");
                              _fetchEvaluationData();
                            });
                          },
                        ),
                        const Spacer(),
                        HalfYearToggle(
                          selectedHalf: selectedHalf,
                          onHalfYearChanged: (half) {
                            setState(() {
                              selectedHalf = half;
                              _fetchEvaluationData();
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 28),
                Obx(() {
                  return EvaluationGradeSection(
                    grade: evaluationController.gradeName.value,
                    experiencePoints:
                        evaluationController.experiencePoints.value,
                  );
                }),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Image.asset(
                    'assets/images/eval_standard.png',
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
