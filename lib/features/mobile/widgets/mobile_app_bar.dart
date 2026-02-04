import 'package:aya_abdelmoneim_portfolio/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MobileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MobileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return AppBar(
      title: Image.asset(
        'assets/images/Aya2_logo-removebg-preview.png',
        fit: BoxFit.cover,
        height: size.height * 0.2,
      ), //.fadeInLeft(),
      actions: [
        Builder(
          builder: (context) => IconButton(
            icon: SvgPicture.asset(
              'assets/icons/menu.svg',
              color: AppColors.primary,
              width: size.height * 0.03,
            ),
            onPressed: () => Scaffold.of(context).openEndDrawer(),
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          ),
        ), //.fadeInRight(),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(54);
}
