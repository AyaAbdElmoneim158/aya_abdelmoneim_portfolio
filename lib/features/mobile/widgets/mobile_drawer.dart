import 'package:aya_abdelmoneim_portfolio/core/helper/app_constants.dart';
import 'package:aya_abdelmoneim_portfolio/core/helper/app_functions.dart';
import 'package:aya_abdelmoneim_portfolio/core/theme/app_colors.dart';
import 'package:aya_abdelmoneim_portfolio/core/widgets/hover_glow_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MobileDrawer extends StatelessWidget {
  const MobileDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Drawer(
      child: Column(
        children: [
          SizedBox(height: 24),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: SvgPicture.asset(
                'assets/icons/close.svg',
                color: AppColors.primary,
                width: 32,
              ),
              //  Icon(Icons.close),
            ),
          ),
          // Image.asset(
          //   'assets/images/Aya2_logo-removebg-preview.png',
          //   fit: BoxFit.cover,
          //   height: size.height * 0.1,
          // ),
          // CustomAvatar(),
          // Image.asset('assets/images/Aya1_logo.png', width: 184),
          Divider(),
          Column(
            children: AppConstants.navMenuWithoutSkills
                .map(
                  (nav) => NavItem(nav: nav),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  const NavItem({super.key, required this.nav});
  final String nav;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        //Todo: icon-nav
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
        child: Row(
          spacing: 8,
          children: [
            /* "Home",
    "Experience",
    "Projects",
    "Contact", */
            SvgPicture.asset(
              nav == 'Experience'
                  ? "assets/icons/bag.svg"
                  : nav == 'Projects'
                      ? "assets/icons/folder.svg"
                      : nav == 'Contact'
                          ? "assets/icons/contact.svg"
                          : "assets/icons/home.svg",
              color: AppConstants.randomColors.first,
              height: 20,
            ),
            HoverGlowText(
              text: nav,
              glowColor: AppConstants.randomColors.first,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
              onTap: () {
                handleNavigation(nav);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
