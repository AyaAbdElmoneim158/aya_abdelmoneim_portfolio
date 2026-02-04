import 'package:aya_abdelmoneim_portfolio/core/helper/app_constants.dart';
import 'package:aya_abdelmoneim_portfolio/core/helper/portfolio_service.dart';
import 'package:aya_abdelmoneim_portfolio/core/widgets/gradient_section_header.dart';
import 'package:aya_abdelmoneim_portfolio/core/widgets/hover_glow_button.dart';
import 'package:flutter/material.dart';

class SkillSection extends StatelessWidget {
  const SkillSection({super.key, this.isDesktop = false});
  final bool isDesktop;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        key: GlobalKeys.skillsKey,
        padding: appPadding(isDesktop),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GradientSectionHeader(
              sectionName: "Skills",
              iconPath: "assets/icons/skills.svg",
              gradient: AppConstants.randomColors,
              fromRightToLeft: true,
            ),
            const SizedBox(height: 24),

            // Load skills from PortfolioService
            FutureBuilder<List<String>>(
              future: PortfolioService.instance.getSkills(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text("Error loading skills: ${snapshot.error}");
                } else {
                  final skills = snapshot.data!;
                  return Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 8,
                    runSpacing: 8,
                    children: List.generate(
                      skills.length,
                      (index) => SkillWidget(
                        skill: skills[index],
                        glowColor: AppConstants.randomColors[index % AppConstants.randomColors.length],
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SkillWidget extends StatelessWidget {
  const SkillWidget({super.key, required this.skill, required this.glowColor});

  final String skill;
  final Color glowColor;

  @override
  Widget build(BuildContext context) {
    return HoverGlowButton(
      glowColor: glowColor,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          skill,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
    );
  }
}
