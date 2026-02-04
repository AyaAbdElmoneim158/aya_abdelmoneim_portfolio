import 'package:aya_abdelmoneim_portfolio/core/helper/app_constants.dart';
import 'package:aya_abdelmoneim_portfolio/core/helper/app_functions.dart';
import 'package:aya_abdelmoneim_portfolio/core/theme/app_colors.dart';
import 'package:aya_abdelmoneim_portfolio/core/widgets/hover_glow_text.dart';
import 'package:aya_abdelmoneim_portfolio/features/mobile/widgets/mobile_about_section.dart';
import 'package:flutter/material.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({
    super.key,
    this.isDesktop = false,
  });
  final bool isDesktop;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: GlobalKeys.contactKey,
      color: AppColors.cardColor,
      padding: isDesktop ? const EdgeInsets.symmetric(horizontal: 164, vertical: 24) : const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
      margin: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Contact',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
          ),
          SizedBox(height: 6),
          // Text(
          //   'ayhb756@gmail.com ',
          //   style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          //         fontWeight: FontWeight.w400,
          //         color: AppColors.secondary,
          //       ),
          // ),
          SocialBtns(),

          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 64),
            child: Divider(),
          ),
          SizedBox(height: 12),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Wrap(
                  alignment: WrapAlignment.center,
                  children: isDesktop
                      ? AppConstants.navMenu
                          .map(
                            (nav) => Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4),
                              child: HoverGlowText(
                                text: nav,
                                glowColor: AppConstants.randomColors.first,
                                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.primary,
                                    ),
                                onTap: () {
                                  handleNavigation(nav);
                                },
                              ),
                            ),
                          )
                          .toList()
                      : AppConstants.navMenuWithoutSkills
                          .map(
                            (nav) => Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4),
                              child: HoverGlowText(
                                text: nav,
                                glowColor: AppConstants.randomColors.first,
                                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.primary,
                                    ),
                                onTap: () {
                                  handleNavigation(nav);
                                },
                              ),
                            ),
                          )
                          .toList(),
                ),
              ],
            ),
          ),
          SizedBox(height: 12),

          Center(
            child: Text(
              '© ${DateTime.now().year} Aya Abdelmoneim. All rights reserved.',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 10,
                    color: AppColors.secondary,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
