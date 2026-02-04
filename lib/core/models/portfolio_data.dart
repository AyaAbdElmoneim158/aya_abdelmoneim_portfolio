import 'dart:convert';

import 'package:aya_abdelmoneim_portfolio/core/models/about_model.dart';
import 'package:aya_abdelmoneim_portfolio/core/models/education_model.dart';
import 'package:aya_abdelmoneim_portfolio/core/models/experience_model.dart';
import 'package:aya_abdelmoneim_portfolio/core/models/project_model.dart';
import 'package:flutter/services.dart';

class PortfolioData {
  final AboutModel about;
  final List<EducationModel> education;
  final List<String> skills;
  final List<ExperienceModel> experience;
  final List<ProjectModel> projects;

  PortfolioData({
    required this.about,
    required this.education,
    required this.skills,
    required this.experience,
    required this.projects,
  });

  factory PortfolioData.fromJson(Map<String, dynamic> json) {
    return PortfolioData(
      about: AboutModel.fromJson(json['about']),
      education: (json['education'] as List).map((e) => EducationModel.fromJson(e)).toList(),
      skills: List<String>.from(json['skills']),
      experience: (json['experience'] as List).map((e) => ExperienceModel.fromJson(e)).toList(),
      projects: (json['projects'] as List).map((e) => ProjectModel.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'about': about.toJson(),
        'education': education.map((e) => e.toJson()).toList(),
        'skills': skills,
        'experience': experience.map((e) => e.toJson()).toList(),
        'projects': projects.map((e) => e.toJson()).toList(),
      };
}

Future<PortfolioData> loadPortfolioData() async {
  final String jsonString = await rootBundle.loadString('assets/data/portfolio.json');
  final Map<String, dynamic> jsonMap = json.decode(jsonString);
  return PortfolioData.fromJson(jsonMap);
}
