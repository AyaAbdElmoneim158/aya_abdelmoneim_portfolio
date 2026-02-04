import 'package:auto_size_text/auto_size_text.dart';
import 'package:aya_abdelmoneim_portfolio/core/helper/app_constants.dart';
import 'package:aya_abdelmoneim_portfolio/core/theme/app_colors.dart';
import 'package:aya_abdelmoneim_portfolio/core/widgets/gradient_section_header.dart';
import 'package:aya_abdelmoneim_portfolio/core/widgets/hover_lift_card.dart';
import 'package:flutter/material.dart';
import 'package:text_gradiate/text_gradiate.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key, this.isDesktop = false});
  final bool isDesktop;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        key: GlobalKeys.educationKey,
        padding: isDesktop ? const EdgeInsets.symmetric(horizontal: 164) : const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 24,
          children: [
            GradientSectionHeader(
              sectionName: "Education",
              fromRightToLeft: true,
              iconPath: "assets/icons/education.svg",
              gradient: AppConstants.randomColors,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: HoverLiftCard(
                glowColor: AppConstants.randomColors.last,
                child: Education(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Education extends StatelessWidget {
  const Education({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            "Bachelor of Computer Science & Artificial Intelligence",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w400,
                  color: AppColors.primary,
                ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            minFontSize: 16,
            maxFontSize: 16,
          ),
          SizedBox(height: 8),
          AutoSizeText(
            "Benha University | Specialization: Artificial Intelligence",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w400,
                  color: AppColors.lightGray,
                ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            minFontSize: 10,
            maxFontSize: 10,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextGradiate(
              text: Text(
                "2019 – 2023",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
              ),
              colors: AppConstants.randomColors,
            ),
          ),
          // Text(
          //   "2019 – 2023",
          //   style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          //         fontWeight: FontWeight.w400,
          //         fontSize: 12,
          //         color: AppConstants.randomColors.last,
          //       ),
          // ),
        ],
      ),
    );
  }
}
