import 'dart:math';

import 'package:aya_abdelmoneim_portfolio/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

final Random random = Random();
EdgeInsets appPadding(bool isDesktop) => isDesktop ? EdgeInsets.symmetric(horizontal: 164) : EdgeInsets.symmetric(horizontal: 32);

class AppConstants {
  static final randomPallet = random.nextInt(AppColors.palettes.length);
  static final randomColors = AppColors.palettes[AppConstants.randomPallet];
  // randomColors.shuffle();
  // AppColors.palettes[AppConstants.randomPallet].first.withOpacity(p.opacity);

  //Todo: Handle As json
  static List<String> skills = [
    "OOP",
    "SOLID Principles",
    "Clean Code",
    "Problem Solving",
    "Fast Learning",
    "Flutter",
    "Dart",
    "Responsive Design",
    "Localization",
    "Payment Gateways",
    "Provider",
    "Riverpod",
    "Bloc & Cubit",
    "GetX",
    "MVC Architecture",
    "MVVM Architecture",
    "Clean Architecture",
    "RESTful APIs",
    "GraphQL",
    "Firebase",
    "SQLite",
    "Hive",
    "Shared Preferences",
    "Git / GitHub",
    "CI/CD",
    "Deployment (Google Play & App Store)",
    "Teamwork",
    "Active Listening",
    "Time Management"
  ];

  static var primaryColor;
  static List<String> navMenu = [
    "Home",
    "Experience",
    "Projects",
    "Skill",
    "Contact",
  ];
  static List<String> navMenuWithoutSkills = [
    "Home",
    "Experience",
    "Projects",
    "Contact",
  ];
}

class GlobalKeys {
  static final GlobalKey homeKey = GlobalKey();
  static final GlobalKey skillsKey = GlobalKey();
  static final GlobalKey experienceKey = GlobalKey();
  static final GlobalKey projectsKey = GlobalKey();
  static final GlobalKey contactKey = GlobalKey();
  static final GlobalKey educationKey = GlobalKey();
}
