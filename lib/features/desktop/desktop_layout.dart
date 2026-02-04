import 'package:aya_abdelmoneim_portfolio/core/widgets/contact_section.dart';
import 'package:aya_abdelmoneim_portfolio/core/widgets/experience_section.dart';
import 'package:aya_abdelmoneim_portfolio/core/widgets/particles_background.dart';
import 'package:aya_abdelmoneim_portfolio/core/widgets/projects_section.dart';
import 'package:aya_abdelmoneim_portfolio/core/widgets/skill_section.dart';
import 'package:aya_abdelmoneim_portfolio/features/desktop/widgets/desktop_about_section.dart';
import 'package:aya_abdelmoneim_portfolio/features/desktop/widgets/desktop_app_bar.dart';
import 'package:flutter/material.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DesktopAppBar(),
      body: _desktopBody(),
    );
  }

  Widget _desktopBody() {
    return Stack(
      children: [
        const Positioned.fill(
          child: IgnorePointer(child: ParticlesBackground()),
        ),
        SingleChildScrollView(
          child: Column(
            spacing: 36,
            children: [
              // Text("DesktopLayout"),
              DesktopAboutSection(),
              // EducationSection(isDesktop: true),
              ExperienceSection(isDesktop: true), //Todo: todos.field
              ProjectsSection(isDesktop: true),
              SkillSection(isDesktop: true),
              ContactSection(isDesktop: true),
            ],
          ),
        ),
      ],
    );
  }
}
