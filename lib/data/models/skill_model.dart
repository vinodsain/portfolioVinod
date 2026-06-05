class SkillCategory {
  final String title;
  final List<String> skills;

  SkillCategory({required this.title, required this.skills});

  factory SkillCategory.fromJson(Map<String, dynamic> json) {
    return SkillCategory(
      title: json['title'],
      skills: List<String>.from(json['skills']),
    );
  }

  Map<String, dynamic> toJson() {
    return {'title': title, 'skills': skills};
  }
}

class ProficiencySkill {
  final String name;
  final int percentage;

  ProficiencySkill({required this.name, required this.percentage});

  factory ProficiencySkill.fromJson(Map<String, dynamic> json) {
    return ProficiencySkill(name: json['name'], percentage: json['percentage']);
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'percentage': percentage};
  }
}
