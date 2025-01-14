import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../widget/quest_item.dart';

class QuestScreen extends StatefulWidget {
  const QuestScreen({super.key});

  @override
  _QuestScreenState createState() => _QuestScreenState();
}

class _QuestScreenState extends State<QuestScreen> {
  DateTime _selectedDate = DateTime.now();
  int _selectedWeek = 0;

  @override
  void initState() {
    super.initState();
    _initializeSelectedWeek();
  }

  void _initializeSelectedWeek() {
    final weeks = _getWeeksInMonth(_selectedDate);
    for (int i = 0; i < weeks.length; i++) {
      if (_selectedDate.isAfter(weeks[i].start.subtract(const Duration(seconds: 1))) &&
          _selectedDate.isBefore(weeks[i].end.add(const Duration(seconds: 1)))) {
        _selectedWeek = i;
        break;
      }
    }
  }

  // Helper method to calculate the week number within a month
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
      _selectedDate = DateTime(_selectedDate.year, _selectedDate.month + offset, 1);
      _initializeSelectedWeek();
    });
  }

  void _selectYearMonth() async {
    int selectedYear = _selectedDate.year;
    int selectedMonth = _selectedDate.month;

    await showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Select Year and Month", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 150,
                    child: ListWheelScrollView.useDelegate(
                      itemExtent: 30,
                      perspective: 0.005,
                      physics: FixedExtentScrollPhysics(),
                      onSelectedItemChanged: (index) {
                        selectedYear = 2000 + index;
                      },
                      childDelegate: ListWheelChildBuilderDelegate(
                        builder: (context, index) => Center(
                          child: Text("${2000 + index}", style: TextStyle(fontSize: 16)),
                        ),
                        childCount: 101,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 150,
                    child: ListWheelScrollView.useDelegate(
                      itemExtent: 30,
                      perspective: 0.005,
                      physics: FixedExtentScrollPhysics(),
                      onSelectedItemChanged: (index) {
                        selectedMonth = index + 1;
                      },
                      childDelegate: ListWheelChildBuilderDelegate(
                        builder: (context, index) => Center(
                          child: Text("${index + 1}", style: TextStyle(fontSize: 16)),
                        ),
                        childCount: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _selectedDate = DateTime(selectedYear, selectedMonth);
                  _initializeSelectedWeek();
                });
                Navigator.pop(context);
              },
              child: Text("Confirm"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final weeks = _getWeeksInMonth(_selectedDate);
    String yearMonth = DateFormat('yyyy.MM').format(_selectedDate);

    return Scaffold(
      body: Stack(
        children: [
        Positioned(
        top: 0,
        left: 0,
        right: 0,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(28),
            bottomRight: Radius.circular(28),
          ),
          child: Container(
            width: 353,
            decoration: BoxDecoration(
              color: Colors.blue, // 색상 수정 필요
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Year and month with arrows
                GestureDetector(
                  onTap: _selectYearMonth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () => _changeMonth(-1),
                        icon: const Icon(Icons.arrow_left),
                      ),
                      Text(
                        yearMonth,
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        onPressed: () => _changeMonth(1),
                        icon: const Icon(Icons.arrow_right),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Buttons for weeks
                Container(
                  width: 353,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: weeks.asMap().entries.map((entry) {
                          int index = entry.key;
                          DateTimeRange weekRange = entry.value;
                          String weekLabel = "${index + 1}주차";

                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedWeek = index;
                              });
                            },
                            child: Container(
                              color: _selectedWeek == index ? const Color(0xFF073066) : Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                              child: Column(
                                children: [
                                  Text(
                                    weekLabel,
                                    style: TextStyle(
                                      color: _selectedWeek == index ? Colors.white : Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  if (_selectedWeek == index)
                                    Text(
                                      "${DateFormat('MM.dd').format(weekRange.start)} - ${DateFormat('MM.dd').format(weekRange.end)}",
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
          Positioned(top: 200, //margin
            left: 0,
            right: 0,
            bottom: 0, // Extend to the bottom of the screen
            child: SingleChildScrollView( // Wrap with SingleChildScrollView
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    // Example QuestItems - replace with your actual data
                    QuestItem(
                      title: '물류센터 대량 입고검수 특근',
                      role: '개발자',
                      leader: true,
                      grade: 1,
                    ),
                    const SizedBox(height: 16),
                    QuestItem(
                      title: 'UI/UX 디자인',
                      role: '디자이너',
                      leader: false,
                      grade: 2,
                    ),
                    // Add more QuestItems as needed
                  ],
                ),
              ),
            ),
          )
      ],
      ),
    );
  }
}
