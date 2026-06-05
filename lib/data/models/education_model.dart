class EducationEntry {
  final String period;
  final String degree;
  final String school;

  EducationEntry({
    required this.period,
    required this.degree,
    required this.school,
  });

  factory EducationEntry.fromJson(Map<String, dynamic> json) {
    return EducationEntry(
      period: json['period'],
      degree: json['degree'],
      school: json['school'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'period': period, 'degree': degree, 'school': school};
  }
}
