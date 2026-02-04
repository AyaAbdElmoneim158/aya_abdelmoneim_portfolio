import 'package:aya_abdelmoneim_portfolio/core/helper/app_constants.dart';
import 'package:aya_abdelmoneim_portfolio/core/helper/app_functions.dart';
import 'package:aya_abdelmoneim_portfolio/core/theme/app_colors.dart';
import 'package:aya_abdelmoneim_portfolio/core/widgets/hover_glow_text.dart';
import 'package:flutter/material.dart';

class DesktopAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DesktopAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return AppBar(
      actions: [
        Padding(
          padding: const EdgeInsets.only(left: 164),
          child: Image.asset(
            'assets/icons/logo.png',
            fit: BoxFit.cover,
            height: size.height * 0.08,
          ),
          //.fadeInLeft(),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(right: 164),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ...AppConstants.navMenu.map((nav) => NavItem(nav: nav)), //.fadeInRight()),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(54);
}

class NavItem extends StatelessWidget {
  const NavItem({super.key, required this.nav});
  final String nav;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: HoverGlowText(
        text: nav,
        glowColor: AppConstants.randomColors.first,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.primary,
            ),
        onTap: () {
          handleNavigation(nav);
        },
      ),
    );
  }
}
