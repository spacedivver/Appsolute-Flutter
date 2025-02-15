class Evaluation {
  final String gradeName;
  final int xp;

  Evaluation({
    required this.gradeName,
    required this.xp,
  });

  factory Evaluation.fromJson(Map<String, dynamic> json) {
    return Evaluation(
      gradeName: json['gradeName'],
      xp: json['xp'],
    );
  }
}
