class DepartmentQuest {
  final int departmentGroupQuestId;
  final String departmentQuestType;
  final double maxThreshold;
  final double mediumThreshold;
  final String departmentGroupQuestStatus;
  final int mediumPoint;
  final int maxPoint;
  final int? year;
  final int? month;
  final int? week;
  final int nowXP;
  final String departmentName;
  final String departmentGroupName;
  final String? note;

  DepartmentQuest({
    required this.departmentGroupQuestId,
    required this.departmentQuestType,
    required this.maxThreshold,
    required this.mediumThreshold,
    required this.departmentGroupQuestStatus,
    required this.mediumPoint,
    required this.maxPoint,
    this.year,
    this.month,
    this.week,
    required this.nowXP,
    required this.departmentName,
    required this.departmentGroupName,
    this.note,
  });

  factory DepartmentQuest.fromJson(Map<String, dynamic> json) {
    return DepartmentQuest(
      departmentGroupQuestId: json['departmentGroupQuestId'] ?? 0,
      departmentQuestType: json['departmentQuestType'] ?? '',
      maxThreshold: (json['maxThreshold'] ?? 0.0).toDouble(),
      mediumThreshold: (json['mediumThreshold'] ?? 0.0).toDouble(),
      departmentGroupQuestStatus: json['departmentGroupQuestStatus'] ?? 'READY',
      mediumPoint: json['mediumPoint'] ?? 0,
      maxPoint: json['maxPoint'] ?? 0,
      year: json['year'],
      month: json['month'],
      week: json['week'],
      nowXP: json['nowXP'] ?? 0,
      departmentName: json['departmentName'] ?? '정보 없음',
      departmentGroupName: json['departmentGroupName'] ?? '정보 없음',
      note: json['note'],
    );
  }
}
