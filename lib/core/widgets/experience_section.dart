import 'package:auto_size_text/auto_size_text.dart';
import 'package:aya_abdelmoneim_portfolio/core/helper/app_constants.dart';
import 'package:aya_abdelmoneim_portfolio/core/helper/portfolio_service.dart';
import 'package:aya_abdelmoneim_portfolio/core/models/experience_model.dart';
import 'package:aya_abdelmoneim_portfolio/core/widgets/gradient_section_header.dart';
import 'package:aya_abdelmoneim_portfolio/core/widgets/hover_lift_card.dart';
import 'package:flutter/material.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key, this.isDesktop = false});
  final bool isDesktop;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        key: GlobalKeys.experienceKey,
        padding: isDesktop ? const EdgeInsets.symmetric(horizontal: 164) : const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GradientSectionHeader(
              sectionName: "Experience",
              fromRightToLeft: true,
              iconPath: "assets/icons/bag.svg",
              gradient: AppConstants.randomColors,
            ),
            const SizedBox(height: 24),

            // Load experiences from PortfolioService
            FutureBuilder<List<ExperienceModel>>(
              future: PortfolioService.instance.getExperience(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text("Error loading experience: ${snapshot.error}");
                } else {
                  final experiences = snapshot.data!;
                  return Column(
                    children: List.generate(
                      experiences.length,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: HoverLiftCard(
                          glowColor: AppConstants.randomColors[index % AppConstants.randomColors.length],
                          child: ExperienceWidget(
                            experience: experiences[index],
                          ),
                        ),
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

class ExperienceWidget extends StatelessWidget {
  const ExperienceWidget({super.key, required this.experience});
  final ExperienceModel experience;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  experience.image,
                  height: 30,
                  width: 30,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      '${experience.position} at ${experience.company}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      minFontSize: 14,
                      maxFontSize: 14,
                    ),
                    AutoSizeText(
                      experience.info,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600, color: Colors.grey.shade400),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      minFontSize: 10,
                      maxFontSize: 10,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              AutoSizeText(
                experience.period,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppConstants.randomColors.last,
                    ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                minFontSize: 10,
                maxFontSize: 10,
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Todo points
          ...experience.todo.map(
            (todo) => Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "   • ",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppConstants.randomColors.first,
                      ),
                ),
                Expanded(
                  child: AutoSizeText(
                    todo,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade400,
                        ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    minFontSize: 11,
                    maxFontSize: 11,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
