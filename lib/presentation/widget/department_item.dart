import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../constants/theme.dart';
import '../../domain/model/department_quest_detail.dart';
import '../controller/department_quest_controller.dart';

class DepartmentItem extends StatelessWidget {
  final String departmentName; // 부서 이름
  final String departmentGroupName; // 부서 그룹 이름
  final String status; // 상태
  final String experienceMessage;
  final int departmentGroupQuestId; // 경험치 메시지

  const DepartmentItem({
    super.key,
    required this.departmentName,
    required this.departmentGroupName,
    required this.status,
    required this.experienceMessage,
    required this.departmentGroupQuestId,
  });

  void _showBottomSheet(BuildContext context) {
    final controller = Get.find<DepartmentQuestController>();
    controller.fetchDepartmentQuestDetail(departmentGroupQuestId);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Obx(() {
        final detail = controller.selectedQuestDetail.value;
        if (detail == null) {
          return const Center(child: CircularProgressIndicator());
        }

        return ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 800),
          child: Column(
            children: [
              // Scrollable content
              Expanded(
                child: SingleChildScrollView(
                  child: _buildMemberBottomSheet(
                    context,
                    detail: detail,
                    departmentName: departmentName,
                    departmentGroupName: departmentGroupName,
                  ),
                ),
              ),
              // Fixed close button at the bottom
              Container(
                height: 106,
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 20,
                  right: 20,
                  bottom: 35,
                ),
                decoration: const BoxDecoration(color: Colors.white),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: double.infinity,
                        height: 51,
                        decoration: ShapeDecoration(
                          color: const Color(0xFF1073F4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            '닫기',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 19,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w600,
                              height: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildMemberBottomSheet(
    BuildContext context, {
    required DepartmentQuestDetailResponse detail,
    required String departmentName,
    required String departmentGroupName,
  }) {
    String? selectedDate;
    return StatefulBuilder(builder: (context, setState) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: ShapeDecoration(
                color: const Color(0xFFF6F6F8),
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
                    '직무별',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF008C6D),
                      fontSize: 16,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w400,
                      height: 1,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Text(
              '직무별 $departmentName $departmentGroupName 그룹 퀘스트',
              style: const TextStyle(
                fontSize: 23,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w700,
                height: 1,
              ),
            ),
            const SizedBox(height: 64),
            const Text(
              '| 퀘스트 달성 내용',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w700,
                height: 1,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F6F8),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (detail.productivity < 4.3)
                    SvgPicture.asset(
                      'assets/images/min.svg',
                    )
                  else if (detail.productivity >= 4.3 &&
                      detail.productivity < 5.1)
                    SvgPicture.asset(
                      'assets/images/mid.svg',
                    )
                  else
                    SvgPicture.asset(
                      'assets/images/max.svg',
                    )
                ],
              ),
            ),
            const SizedBox(height: 26),
            const Divider(),
            const SizedBox(height: 26),
            Row(
              children: [
                const Text(
                  '| 획득한 경험치',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w700,
                    height: 1,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                          height: 22, width: 22, 'assets/icons/exp.svg'),
                      const SizedBox(width: 7),
                      Text(
                        '${detail.gainedXP}XP',
                        style: const TextStyle(
                          color: Color(0xFF343A40),
                          fontSize: 20,
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
            const SizedBox(height: 26),
            const Divider(),
            const SizedBox(height: 26),
            Row(
              children: [
                const Text(
                  '| 생산성',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w700,
                    height: 1,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  child: Text(
                    '${detail.productivity}',
                    style: const TextStyle(
                      color: Color(0xFF343A40),
                      fontSize: 20,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w700,
                      height: 1,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 26),
            const Divider(),
            const SizedBox(height: 26),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: detail.detailList.take(7).map((item) {
                    final isSelected =
                        selectedDate == item.departmentQuestDetailDate;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedDate = item.departmentQuestDetailDate;
                        });
                      },
                      child: Container(
                        width: isSelected ? 60 : 49,
                        height: 60,
                        padding: isSelected
                            ? const EdgeInsets.only(bottom: 2) // 선택된 날짜 스타일
                            : null, // 선택되지 않은 날짜 스타일
                        decoration: isSelected
                            ? ShapeDecoration(
                                color: const Color(0xFF073066),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              )
                            : ShapeDecoration(
                                color: const Color(0xBFE7F1FE),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (!isSelected)
                              SizedBox(
                                width: double.infinity,
                                child: Opacity(
                                  opacity: 0.70,
                                  child: Text(
                                    '${item.departmentQuestDetailDate.split("-")[2]}일', // 예: 15일
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Color(0xFF073066),
                                      fontSize: 15,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w600,
                                      height: 1,
                                    ),
                                  ),
                                ),
                              ),
                            if (isSelected) ...[
                              SizedBox(
                                width: double.infinity,
                                child: Text(
                                  '${item.departmentQuestDetailDate.split("-")[1]}월', // 예: 1월
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w500,
                                    height: 1,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 6),
                              SizedBox(
                                width: double.infinity,
                                child: Text(
                                  '${item.departmentQuestDetailDate.split("-")[2]}일', // 예: 21일
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w600,
                                    height: 1,
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 16),
                if (selectedDate != null) ...[
                  Container(
                    decoration: ShapeDecoration(
                      color: const Color(0xBFE7F1FE),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // 수익 표시
                          Row(
                            children: [
                              const Text(
                                '수익',
                                style: TextStyle(
                                  color: Color(0xFFFF3030),
                                  fontSize: 17,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w700,
                                  height: 1,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Container(
                                  height: 26,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFFF3030),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                '${detail.detailList.firstWhere((item) => item.departmentQuestDetailDate == selectedDate).revenue}',
                                style: const TextStyle(
                                  color: Color(0xFFFF3030),
                                  fontSize: 17,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w700,
                                  height: 1,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          // 지출 표시
                          Row(
                            children: [
                              const Text(
                                '지출',
                                style: TextStyle(
                                  color: Color(0xFF1073F4),
                                  fontSize: 17,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w700,
                                  height: 1,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Container(
                                  height: 26,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF1073F4),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                '${detail.detailList.firstWhere((item) => item.departmentQuestDetailDate == selectedDate).laborCost + detail.detailList.firstWhere((item) => item.departmentQuestDetailDate == selectedDate).designServiceFee + detail.detailList.firstWhere((item) => item.departmentQuestDetailDate == selectedDate).employeeSalary + detail.detailList.firstWhere((item) => item.departmentQuestDetailDate == selectedDate).retirementBenefit + detail.detailList.firstWhere((item) => item.departmentQuestDetailDate == selectedDate).socialInsuranceBenefit}',
                                style: const TextStyle(
                                  color: Color(0xFF1073F4),
                                  fontSize: 17,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w700,
                                  height: 1,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          const Divider(),
                          const SizedBox(height: 20),
                          // 지출 상세 내역
                          const Text(
                            '<지출 상세 내역>',
                            style: TextStyle(
                              color: Color(0xFF1073F4),
                              fontSize: 17,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w700,
                              height: 1,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Table(
                            border: TableBorder.all(
                              color: const Color(0xFF408FF6),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            columnWidths: const {
                              0: FlexColumnWidth(1),
                              1: FlexColumnWidth(1),
                            },
                            children: [
                              const TableRow(
                                decoration: BoxDecoration(
                                  color: Color(0xFF408FF6),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      topRight: Radius.circular(12)),
                                ),
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      '지출 항목',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w600,
                                        height: 1,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      '금액',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w600,
                                        height: 1,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              ...detail.detailList
                                  .where((item) =>
                                      item.departmentQuestDetailDate ==
                                      selectedDate)
                                  .map((item) => [
                                        TableRow(
                                          children: [
                                            const Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Text(
                                                '인건비',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Color(0xFF1073F4),
                                                  fontSize: 15,
                                                  fontFamily: 'Pretendard',
                                                  fontWeight: FontWeight.w600,
                                                  height: 1,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                '${item.laborCost}',
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                  color: Color(0xFF1073F4),
                                                  fontSize: 15,
                                                  fontFamily: 'Pretendard',
                                                  fontWeight: FontWeight.w600,
                                                  height: 1,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        TableRow(
                                          children: [
                                            const Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Text(
                                                '직원 급여',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Color(0xFF1073F4),
                                                  fontSize: 15,
                                                  fontFamily: 'Pretendard',
                                                  fontWeight: FontWeight.w600,
                                                  height: 1,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                '${item.employeeSalary}',
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                  color: Color(0xFF1073F4),
                                                  fontSize: 15,
                                                  fontFamily: 'Pretendard',
                                                  fontWeight: FontWeight.w600,
                                                  height: 1,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        TableRow(
                                          children: [
                                            const Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Text(
                                                '퇴직 급여',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Color(0xFF1073F4),
                                                  fontSize: 15,
                                                  fontFamily: 'Pretendard',
                                                  fontWeight: FontWeight.w600,
                                                  height: 1,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                '${item.retirementBenefit}',
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                  color: Color(0xFF1073F4),
                                                  fontSize: 15,
                                                  fontFamily: 'Pretendard',
                                                  fontWeight: FontWeight.w600,
                                                  height: 1,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        TableRow(
                                          children: [
                                            const Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Text(
                                                '4대 보험료',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Color(0xFF1073F4),
                                                  fontSize: 15,
                                                  fontFamily: 'Pretendard',
                                                  fontWeight: FontWeight.w600,
                                                  height: 1,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                '${item.socialInsuranceBenefit}',
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                  color: Color(0xFF1073F4),
                                                  fontSize: 15,
                                                  fontFamily: 'Pretendard',
                                                  fontWeight: FontWeight.w600,
                                                  height: 1,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        TableRow(
                                          children: [
                                            const Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Text(
                                                '설계용역비',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Color(0xFF1073F4),
                                                  fontSize: 15,
                                                  fontFamily: 'Pretendard',
                                                  fontWeight: FontWeight.w600,
                                                  height: 1,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                '${item.designServiceFee}',
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                  color: Color(0xFF1073F4),
                                                  fontSize: 15,
                                                  fontFamily: 'Pretendard',
                                                  fontWeight: FontWeight.w600,
                                                  height: 1,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ])
                                  .expand((element) => element),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ]
              ],
            ),
          ],
        ),
      );
    });
  }

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
                                color: const Color(0xFFCCFFF2),
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
                                    '직무별',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF008C6D),
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
                              '직무별 $departmentName $departmentGroupName 그룹 퀘스트', // 동적으로 바뀌는 부분
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
                              : status == 'Mid'
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
                              : status == 'Mid'
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
          GestureDetector(
            onTap: () => _showBottomSheet(context),
            child: Container(
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
          ),
        ],
      ),
    );
  }
}
