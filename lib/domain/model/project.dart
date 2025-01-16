class Project {
  final int projectId;
  final int month;
  final int day;
  final String projectName;
  final int grantedPoint;
  final String note;

  Project({
    required this.projectId,
    required this.month,
    required this.day,
    required this.projectName,
    required this.grantedPoint,
    required this.note,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      projectId: json['projectId'],
      month: json['month'],
      day: json['day'],
      projectName: json['projectName'],
      grantedPoint: json['grantedPoint'],
      note: json['note'],
    );
  }
}
