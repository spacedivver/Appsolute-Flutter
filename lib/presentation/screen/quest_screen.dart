import 'package:appsolute_android/constants/theme.dart';
import 'package:appsolute_android/domain/model/leader_quest.dart';
import 'package:appsolute_android/presentation/controller/user_info_controller.dart';
import 'package:appsolute_android/presentation/widget/department_item.dart';
import 'package:appsolute_android/presentation/widget/leader_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';
import '../controller/department_quest_controller.dart';

import '../controller/leader_quest_controller.dart';
import '../widget/week_selector.dart';
import '../widget/year_month_selector.dart';

class QuestScreen extends StatefulWidget {
  const QuestScreen({super.key});

  @override
  _QuestScreenState createState() => _QuestScreenState();
}

class _QuestScreenState extends State<QuestScreen> {
  DateTime _selectedDate = DateTime.now();
  int _selectedWeek = 0;
  final DepartmentQuestController _departmentQuestController =
      Get.put(DepartmentQuestController());
  final LeaderQuestController _leaderQuestController =
      Get.put(LeaderQuestController());
  final UserInfoController _userInfoController = Get.put(UserInfoController());

  @override
  void initState() {
    super.initState();
    _initializeSelectedWeek();
    _fetchDepartmentQuest();
    _fetchLeaderQuests();
    // API 호출
  }

  void _fetchLeaderQuests() async {
    final userId = _userInfoController.userId.value; // 실제 사용자 ID로 변경
    final month = _selectedDate.month;
    await _leaderQuestController.fetchLeaderQuests(userId, month);
  }

  void _initializeSelectedWeek() {
    final weeks = _getWeeksInMonth(_selectedDate);
    for (int i = 0; i < weeks.length; i++) {
      if (_selectedDate
              .isAfter(weeks[i].start.subtract(const Duration(seconds: 1))) &&
          _selectedDate
              .isBefore(weeks[i].end.add(const Duration(seconds: 1)))) {
        _selectedWeek = i;
        break;
      }
    }
  }

  List<DateTimeRange> _getWeeksInMonth(DateTime date) {
    List<DateTimeRange> weeks = [];
    DateTime firstDayOfMonth = DateTime(date.year, date.month, 1);
    DateTime firstDayOfNextMonth = DateTime(date.year, date.month + 1, 1);

    DateTime currentWeekStart = firstDayOfMonth;
    while (currentWeekStart.isBefore(firstDayOfNextMonth)) {
      DateTime currentWeekEnd = currentWeekStart.add(const Duration(days: 6));
      if (currentWeekEnd.isAfter(firstDayOfNextMonth)) {
        currentWeekEnd = firstDayOfNextMonth.subtract(const Duration(days: 1));
      }
      weeks.add(DateTimeRange(start: currentWeekStart, end: currentWeekEnd));
      currentWeekStart = currentWeekStart.add(const Duration(days: 7));
    }
    return weeks;
  }

  void _changeMonth(int offset) {
    setState(() {
      _selectedDate =
          DateTime(_selectedDate.year, _selectedDate.month + offset, 1);
      _initializeSelectedWeek();
      _fetchDepartmentQuest(); // 월 변경 시 API 호출
    });
  }

  void _fetchDepartmentQuest() async {
    await _departmentQuestController
        .fetchDepartmentQuest(_selectedDate); // API 호출
  }

  void _selectYearMonth() async {
    await showModalBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(color: Color(0xFF1073F4)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '취소',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w500,
                                height: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _initializeSelectedWeek();
                        });
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '확인',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
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
              ),
              SizedBox(
                height: 250,
                child: ScrollDatePicker(
                  minimumDate: DateTime(2020, 1, 1),
                  maximumDate: DateTime(DateTime.now().year, 12, 31),
                  selectedDate: DateTime(DateTime.now().month),
                  locale: const Locale('ko'),
                  onDateTimeChanged: (DateTime value) {
                    setState(() {
                      _selectedDate = value;
                    });
                  },
                  scrollViewOptions: const DatePickerScrollViewOptions(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    year: ScrollViewDetailOptions(
                      selectedTextStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w600,
                        height: 1,
                      ),
                      textStyle: TextStyle(
                        color: AppTheme.gray1,
                        fontSize: 18,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w600,
                        height: 1,
                      ),
                      label: '년',
                      margin: EdgeInsets.only(left: 50),
                    ),
                    month: ScrollViewDetailOptions(
                      label: '월',
                      selectedTextStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w600,
                        height: 1,
                      ),
                      textStyle: TextStyle(
                        color: AppTheme.gray1,
                        fontSize: 18,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w600,
                        height: 1,
                      ),
                    ),
                    day: ScrollViewDetailOptions(
                      label: '일',
                      textStyle: TextStyle(
                        color: AppTheme.gray1,
                        fontSize: 18,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w600,
                        height: 1,
                      ),
                      selectedTextStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w600,
                        height: 1,
                      ),
                      margin: EdgeInsets.only(right: 50),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final weeks = _getWeeksInMonth(_selectedDate);
    String yearMonth = DateFormat('yyyy.MM').format(_selectedDate);

    return Scaffold(
      backgroundColor: AppTheme.blue50,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(28),
                    bottomRight: Radius.circular(28),
                  ),
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color(0xFF1073F4),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 12, left: 20, right: 20),
                          child: YearMonthSelector(
                            yearMonth: yearMonth,
                            onPreviousMonth: () => _changeMonth(-1),
                            onNextMonth: () => _changeMonth(1),
                            onSelectYearMonth: _selectYearMonth,
                          ),
                        ),
                        const SizedBox(height: 24),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: WeekSelector(
                            weeks: weeks,
                            selectedWeek: _selectedWeek,
                            onWeekSelected: (index) {
                              setState(() {
                                _selectedWeek = index;
                              });
                            },
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 31, left: 20, right: 20),
            sliver: Obx(() {
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final quest =
                        _departmentQuestController.departmentQuests[index];
                    return Column(
                      children: [
                        DepartmentItem(
                          departmentGroupName: quest.departmentGroupName,
                          departmentName: quest.departmentName,
                          status: quest.nowXP == 0
                              ? 'Min'
                              : (quest.nowXP <= 40 ? 'Mid' : 'Max'),
                          experienceMessage: quest.nowXP == 0
                              ? '경험치가 아직 그대로에요!'
                              : '경험치가 ${quest.nowXP}만큼 상승했어요!',
                          departmentGroupQuestId: quest.departmentGroupQuestId,
                        ),
                        if (index ==
                            _departmentQuestController.departmentQuests.length -
                                1)
                          const SizedBox(height: 16),
                        const SizedBox(height: 16),
                      ],
                    );
                  },
                  childCount:
                      _departmentQuestController.departmentQuests.length,
                ),
              );
            }),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: Obx(() {
              if (_leaderQuestController.isLoading.value) {
                return const SliverToBoxAdapter(
                  child: Center(child: CircularProgressIndicator()),
                );
              }

              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final item = _leaderQuestController.leaderQuests[index];
                    return LeaderItem(
                      questName: item.questName,
                      status: item.questStatus,
                      experienceMessage: item.questStatus == 'Min'
                          ? '경험치가 아직 그대로에요!'
                          : '경험치가 ${item.grantedPoint}만큼 상승했어요!',
                    );
                  },
                  childCount: _leaderQuestController.leaderQuests.length,
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
