class ProjectModel {
  final String name;
  final String desc;
  final List<String> responsibilities;
  final String techs;
  final String image;
  final String link;

  ProjectModel({
    required this.name,
    required this.desc,
    required this.responsibilities,
    required this.techs,
    required this.image,
    required this.link,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      name: json['name'],
      desc: json['desc'],
      responsibilities: List<String>.from(json['responsibilities']),
      techs: json['techs'],
      image: json['image'],
      link: json['link'],
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'desc': desc,
        'responsibilities': responsibilities,
        'techs': techs,
        'image': image,
        'link': link,
      };
}
