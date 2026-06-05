class ExperienceEntry {
  final String period;
  final String company;
  final String role;
  final String location;
  final List<Project> projects;

  ExperienceEntry({
    required this.period,
    required this.company,
    required this.role,
    required this.location,
    required this.projects,
  });

  factory ExperienceEntry.fromJson(Map<String, dynamic> json) {
    return ExperienceEntry(
      period: json['period'],
      company: json['company'],
      role: json['role'],
      location: json['location'],
      projects: (json['projects'] as List)
          .map((p) => Project.fromJson(p))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'period': period,
      'company': company,
      'role': role,
      'location': location,
      'projects': projects.map((p) => p.toJson()).toList(),
    };
  }
}

class Project {
  final String name;
  final List<String> description;

  Project({required this.name, required this.description});

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      name: json['name'],
      description: List<String>.from(json['description']),
    );
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'description': description};
  }
}
