class LeaderQuest {
  final String employeeName;
  final int month;
  final String questStatus;
  final int grantedPoint;
  final String note;
  final int year;
  final String maxThreshold;
  final String mediumThreshold;
  final String questName;

  LeaderQuest({
    required this.employeeName,
    required this.month,
    required this.questStatus,
    required this.grantedPoint,
    required this.note,
    required this.year,
    required this.maxThreshold,
    required this.mediumThreshold,
    required this.questName,
  });

  // JSON -> LeaderQuest 변환
  factory LeaderQuest.fromJson(Map<String, dynamic> json) {
    return LeaderQuest(
      employeeName: json['employeeName'],
      month: json['month'],
      questStatus: json['questStatus'],
      grantedPoint: json['grantedPoint'],
      note: json['note'],
      year: json['year'],
      maxThreshold: json['maxThreshold'],
      mediumThreshold: json['mediumThreshold'],
      questName: json['questName'],
    );
  }
}
