import 'package:aya_abdelmoneim_portfolio/core/helper/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void handleNavigation(String nav) {
  switch (nav) {
    case "Home":
      Scrollable.ensureVisible(
        GlobalKeys.homeKey.currentContext!,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
      );
      break;

    case "Skill":
      Scrollable.ensureVisible(
        GlobalKeys.skillsKey.currentContext!,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
      );
      break;

    case "Experience":
      Scrollable.ensureVisible(
        GlobalKeys.experienceKey.currentContext!,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
      );
      break;
    case "Projects":
      Scrollable.ensureVisible(
        GlobalKeys.projectsKey.currentContext!,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
      );
      break;

    case "Contact":
      Scrollable.ensureVisible(
        GlobalKeys.contactKey.currentContext!,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
      );

      break;
  }
}

void handleLaunchUrl(String uri) async {
  final Uri url = Uri.parse(uri);
  if (uri.startsWith("mailto:")) {
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
    return;
  }

  if (await canLaunchUrl(url)) {
    await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    );
  }
}
