class PortfolioApp {
  final String name;
  final String category;
  final String description;
  final String icon;
  final String screenshot;
  final double rating;
  final int reviews;
  final String downloads;
  final List<String> technologies;
  final String? googlePlayUrl;
  final String? appStoreUrl;
  final bool isLive;

  PortfolioApp({
    required this.name,
    required this.category,
    required this.description,
    required this.icon,
    required this.screenshot,
    required this.rating,
    required this.reviews,
    required this.downloads,
    required this.technologies,
    this.googlePlayUrl,
    this.appStoreUrl,
    this.isLive = false,
  });

  factory PortfolioApp.fromJson(Map<String, dynamic> json) {
    return PortfolioApp(
      name: json['name'],
      category: json['category'],
      description: json['description'],
      icon: json['icon'],
      screenshot: json['screenshot'],
      rating: json['rating'].toDouble(),
      reviews: json['reviews'],
      downloads: json['downloads'],
      technologies: List<String>.from(json['technologies']),
      googlePlayUrl: json['googlePlayUrl'],
      appStoreUrl: json['appStoreUrl'],
      isLive: json['isLive'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'category': category,
      'description': description,
      'icon': icon,
      'screenshot': screenshot,
      'rating': rating,
      'reviews': reviews,
      'downloads': downloads,
      'technologies': technologies,
      'googlePlayUrl': googlePlayUrl,
      'appStoreUrl': appStoreUrl,
      'isLive': isLive,
    };
  }
}
