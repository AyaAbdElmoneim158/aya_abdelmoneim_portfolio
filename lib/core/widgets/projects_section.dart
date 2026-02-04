import 'package:aya_abdelmoneim_portfolio/core/helper/app_constants.dart';
import 'package:aya_abdelmoneim_portfolio/core/helper/app_functions.dart';
import 'package:aya_abdelmoneim_portfolio/core/helper/portfolio_service.dart';
import 'package:aya_abdelmoneim_portfolio/core/models/project_model.dart';
import 'package:aya_abdelmoneim_portfolio/core/theme/app_colors.dart';
import 'package:aya_abdelmoneim_portfolio/core/widgets/gradient_section_header.dart';
import 'package:aya_abdelmoneim_portfolio/core/widgets/hover_lift_card.dart';
import 'package:flutter/material.dart';
import 'package:text_gradiate/text_gradiate.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key, this.isDesktop = false});
  final bool isDesktop;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      key: GlobalKeys.projectsKey,
      padding: isDesktop ? const EdgeInsets.symmetric(horizontal: 164) : const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GradientSectionHeader(
            sectionName: "Projects",
            iconPath: "assets/icons/folder.svg",
            gradient: AppConstants.randomColors,
            fromRightToLeft: true,
          ),
          const SizedBox(height: 24),

          // Load projects from PortfolioService
          FutureBuilder<List<ProjectModel>>(
            future: PortfolioService.instance.getProjects(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text("Error loading projects: ${snapshot.error}");
              } else {
                final projects = snapshot.data!;
                return isDesktop
                    ? SizedBox(
                        height: size.height * 0.5,
                        child: ListView.separated(
                          padding: const EdgeInsets.all(12),
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => SizedBox(
                            width: size.width * 0.25,
                            child: HoverLiftCard(
                              glowColor: AppConstants.randomColors[index % AppConstants.randomColors.length],
                              child: ProjectCard(project: projects[index]),
                            ),
                          ),
                          separatorBuilder: (context, index) => const SizedBox(width: 8),
                          itemCount: projects.length,
                        ),
                      )
                    : GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: projects.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                        ),
                        itemBuilder: (context, index) {
                          return HoverLiftCard(
                            glowColor: AppConstants.randomColors[index % AppConstants.randomColors.length],
                            child: ProjectCard(project: projects[index]),
                          );
                        },
                      );
              }
            },
          ),
          const SizedBox(height: 32),

          // Explore more button
          GestureDetector(
            onTap: () async {
              final Uri url = Uri.parse("https://github.com/AyaAbdElmoneim158?tab=repositories");
              if (await canLaunchUrl(url)) {
                await launchUrl(url, mode: LaunchMode.externalApplication);
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.arrow_left_rounded),
                TextGradiate(
                  text: const Text("Explore more"),
                  colors: AppConstants.randomColors,
                ),
                const Icon(Icons.arrow_right_rounded),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------- Project Card Widget ----------------------
class ProjectCard extends StatelessWidget {
  const ProjectCard({super.key, required this.project});
  final ProjectModel project;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(18),
                topRight: Radius.circular(18),
              ),
              child: Image.asset(
                project.image,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  project.name,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                      ),
                ),
                const SizedBox(height: 6),
                Text(
                  project.techs,
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppConstants.randomColors.first,
                      ),
                ),
                const SizedBox(height: 6),
                Text(
                  project.desc,
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.secondary,
                      ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () => handleLaunchUrl(project.link),
                    icon: const Icon(
                      Icons.arrow_outward,
                      color: AppColors.primary,
                      size: 13,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
