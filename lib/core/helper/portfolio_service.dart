import 'dart:convert';
import 'package:aya_abdelmoneim_portfolio/core/models/about_model.dart';
import 'package:aya_abdelmoneim_portfolio/core/models/education_model.dart';
import 'package:aya_abdelmoneim_portfolio/core/models/experience_model.dart';
import 'package:aya_abdelmoneim_portfolio/core/models/portfolio_data.dart';
import 'package:aya_abdelmoneim_portfolio/core/models/project_model.dart';
import 'package:flutter/services.dart';

class PortfolioService {
  PortfolioService._privateConstructor();
  static final PortfolioService _instance = PortfolioService._privateConstructor();
  static PortfolioService get instance => _instance;
  PortfolioData? _data;

  Future<PortfolioData> loadPortfolio() async {
    if (_data != null) return _data!;
    final String jsonString = await rootBundle.loadString('assets/data/portfolio_data.json');
    final Map<String, dynamic> jsonMap = json.decode(jsonString);
    _data = PortfolioData.fromJson(jsonMap);
    return _data!;
  }

  Future<List<String>> getSkills() async {
    return (await loadPortfolio()).skills;
  }

  Future<AboutModel> getAbout() async {
    return (await loadPortfolio()).about;
  }

  Future<List<EducationModel>> getEducation() async {
    return (await loadPortfolio()).education;
  }

  Future<List<ExperienceModel>> getExperience() async {
    return (await loadPortfolio()).experience;
  }

  Future<List<ProjectModel>> getProjects() async {
    return (await loadPortfolio()).projects;
  }
}
