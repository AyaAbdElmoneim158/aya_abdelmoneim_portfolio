import 'package:aya_abdelmoneim_portfolio/core/widgets/contact_section.dart';
import 'package:aya_abdelmoneim_portfolio/core/widgets/experience_section.dart';
import 'package:aya_abdelmoneim_portfolio/core/widgets/particles_background.dart';
import 'package:aya_abdelmoneim_portfolio/core/widgets/projects_section.dart';
import 'package:aya_abdelmoneim_portfolio/features/mobile/widgets/mobile_about_section.dart';
import 'package:aya_abdelmoneim_portfolio/features/mobile/widgets/mobile_app_bar.dart';
import 'package:aya_abdelmoneim_portfolio/features/mobile/widgets/mobile_drawer.dart';
import 'package:flutter/material.dart';

class MobileLayout extends StatefulWidget {
  const MobileLayout({super.key});

  @override
  State<MobileLayout> createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<MobileLayout> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MobileAppBar(),
      endDrawer: MobileDrawer(),
      body: _mobileBody(),
    );
  }

  Widget _mobileBody() {
    return Stack(
      children: [
        const Positioned.fill(
          child: IgnorePointer(child: ParticlesBackground()),
        ),
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 0),
            child: Column(
              spacing: 36,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Text("MobileLayout"),
                MobileAboutSection(),
                // EducationSection(),
                ExperienceSection(), //Todo: todos.field
                ProjectsSection(),
                // SkillSection(),
                ContactSection(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
// neon border
