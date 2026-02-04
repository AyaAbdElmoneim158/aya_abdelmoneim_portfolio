class ExperienceModel {
  final String period;
  final String position;
  final String company;
  final String info;
  final String desc;
  final String image;
  final List<String> skills;
  final List<String> todo;

  ExperienceModel({
    required this.period,
    required this.position,
    required this.company,
    required this.info,
    required this.desc,
    required this.image,
    required this.skills,
    required this.todo,
  });

  factory ExperienceModel.fromJson(Map<String, dynamic> json) {
    return ExperienceModel(
      period: json['period'],
      position: json['position'],
      company: json['company'],
      info: json['info'],
      desc: json['desc'],
      image: json['image'],
      skills: List<String>.from(json['skills']),
      todo: List<String>.from(json['todo']),
    );
  }

  Map<String, dynamic> toJson() => {
        'period': period,
        'position': position,
        'company': company,
        'info': info,
        'desc': desc,
        'image': image,
        'skills': skills,
        'todo': todo,
      };
}
