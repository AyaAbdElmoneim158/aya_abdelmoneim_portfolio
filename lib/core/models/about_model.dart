class AboutModel {
  final String name;
  final String title;
  final String summary;
  final String email;
  final String portfolio;
  final String linkedin;
  final String github;

  AboutModel({
    required this.name,
    required this.title,
    required this.summary,
    required this.email,
    required this.portfolio,
    required this.linkedin,
    required this.github,
  });

  factory AboutModel.fromJson(Map<String, dynamic> json) {
    return AboutModel(
      name: json['name'],
      title: json['title'],
      summary: json['summary'],
      email: json['email'],
      portfolio: json['portfolio'],
      linkedin: json['linkedin'],
      github: json['github'],
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'title': title,
        'summary': summary,
        'email': email,
        'portfolio': portfolio,
        'linkedin': linkedin,
        'github': github,
      };
}
