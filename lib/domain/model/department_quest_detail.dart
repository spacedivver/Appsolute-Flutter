class DepartmentQuestDetail {
  final String departmentQuestDetailDate;
  final double revenue;
  final double laborCost;
  final double designServiceFee;
  final double employeeSalary;
  final double retirementBenefit;
  final double socialInsuranceBenefit;

  DepartmentQuestDetail({
    required this.departmentQuestDetailDate,
    required this.revenue,
    required this.laborCost,
    required this.designServiceFee,
    required this.employeeSalary,
    required this.retirementBenefit,
    required this.socialInsuranceBenefit,
  });

  factory DepartmentQuestDetail.fromJson(Map<String, dynamic> json) {
    return DepartmentQuestDetail(
      departmentQuestDetailDate: json['departmentQuestDetailDate'],
      revenue: json['revenue'],
      laborCost: json['laborCost'],
      designServiceFee: json['designServiceFee'],
      employeeSalary: json['employeeSalary'],
      retirementBenefit: json['retirementBenefit'],
      socialInsuranceBenefit: json['socialInsuranceBenefit'],
    );
  }
}

class DepartmentQuestDetailResponse {
  final List<DepartmentQuestDetail> detailList;
  final int gainedXP;
  final double productivity;
  final String questStatus;

  DepartmentQuestDetailResponse({
    required this.detailList,
    required this.gainedXP,
    required this.productivity,
    required this.questStatus,
  });

  factory DepartmentQuestDetailResponse.fromJson(Map<String, dynamic> json) {
    return DepartmentQuestDetailResponse(
      detailList: (json['detailList'] as List)
          .map((detail) => DepartmentQuestDetail.fromJson(detail))
          .toList(),
      gainedXP: json['gainedXP'],
      productivity: json['productivity'].toDouble(),
      questStatus: json['questStatus'],
    );
  }
}
