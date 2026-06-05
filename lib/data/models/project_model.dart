class ProjectShowcase {
  final String title;
  final String icon;
  final String description;
  final List<String> tags;
  final String? link;
  final String? linkText;
  final String badge;

  ProjectShowcase({
    required this.title,
    required this.icon,
    required this.description,
    required this.tags,
    this.link,
    this.linkText,
    required this.badge,
  });

  factory ProjectShowcase.fromJson(Map<String, dynamic> json) {
    return ProjectShowcase(
      title: json['title'],
      icon: json['icon'],
      description: json['description'],
      tags: List<String>.from(json['tags']),
      link: json['link'],
      linkText: json['linkText'],
      badge: json['badge'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'icon': icon,
      'description': description,
      'tags': tags,
      'link': link,
      'linkText': linkText,
      'badge': badge,
    };
  }
}
