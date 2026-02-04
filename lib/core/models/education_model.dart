class EducationModel {
  final String degree;
  final String period;
  final String university;
  final String specialization;

  EducationModel({
    required this.degree,
    required this.period,
    required this.university,
    required this.specialization,
  });

  factory EducationModel.fromJson(Map<String, dynamic> json) {
    return EducationModel(
      degree: json['degree'],
      period: json['period'],
      university: json['university'],
      specialization: json['specialization'],
    );
  }

  Map<String, dynamic> toJson() => {
        'degree': degree,
        'period': period,
        'university': university,
        'specialization': specialization,
      };
}
