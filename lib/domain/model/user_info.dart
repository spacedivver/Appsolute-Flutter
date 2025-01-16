class UserInfo {
  final String employeeNumber;
  final String userName;
  final DateTime joiningDate;
  final String userId;
  final String departmentName;
  final String departmentGroupName;
  final String? characterName;
  final String? characterImage;
  final String levelName;
  final int lastYearTotalXP;
  final int thisYearTotalXP;
  final int nextLevelRemainXP;
  final int thisEvaluationXP;
  final int thisDepartmentGroupXP;
  final int thisProjectXP;
  final int thisLeQuestXP;
  final bool isLastLevel;
  final int totalXP;

  UserInfo({
    required this.employeeNumber,
    required this.userName,
    required this.joiningDate,
    required this.userId,
    required this.departmentName,
    required this.departmentGroupName,
    this.characterName,
    this.characterImage,
    required this.levelName,
    required this.lastYearTotalXP,
    required this.thisYearTotalXP,
    required this.nextLevelRemainXP,
    required this.thisEvaluationXP,
    required this.thisDepartmentGroupXP,
    required this.thisProjectXP,
    required this.thisLeQuestXP,
    required this.isLastLevel,
    required this.totalXP,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      employeeNumber: json['employeeNumber'],
      userName: json['userName'],
      joiningDate: DateTime.parse(json['joiningDate']),
      userId: json['userId'],
      departmentName: json['departmentName'],
      departmentGroupName: json['departmentGroupName'],
      characterName: json['characterName'],
      characterImage: json['characterImage'],
      levelName: json['levelName'],
      lastYearTotalXP: json['lastYearTotalXP'],
      thisYearTotalXP: json['thisYearTotalXP'],
      nextLevelRemainXP: json['nextLevelRemainXP'],
      thisEvaluationXP: json['thisEvaluationXP'],
      thisDepartmentGroupXP: json['thisDepartmentGroupXP'],
      thisProjectXP: json['thisProjectXP'],
      thisLeQuestXP: json['thisLeQuestXP'],
      isLastLevel: json['isLastLevel'],
      totalXP: json['totalXP'],
    );
  }
}
