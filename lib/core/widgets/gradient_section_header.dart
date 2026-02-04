import 'package:aya_abdelmoneim_portfolio/core/helper/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:text_gradiate/text_gradiate.dart';

class GradientSectionHeader extends StatelessWidget {
  const GradientSectionHeader({
    super.key,
    required this.sectionName,
    this.sectionDec,
    required this.gradient,
    this.fontSize = 24,
    this.fromRightToLeft = false,
    this.iconPath = "assets/icons/section_icon.svg",
  });
  final String sectionName;
  final String? sectionDec;
  final List<Color> gradient;
  final double? fontSize;
  final bool fromRightToLeft;
  final String iconPath;
// = "assets/icons/section_icon.svg";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextGradiate(
              text: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 6,
                children: [
                  SvgPicture.asset(
                    iconPath,
                    color: AppConstants.randomColors.last,
                    height: fontSize,
                  ),
                  Text(
                    sectionName,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          fontWeight: FontWeight.w800,
                          // fontSize: fontSize,
                        ),
                  ),
                ],
              ),
              colors: gradient,
              gradientType: GradientType.linear,
              begin: fromRightToLeft ? Alignment.centerRight : Alignment.topCenter,
              end: fromRightToLeft ? Alignment.centerLeft : Alignment.bottomCenter,
              tileMode: TileMode.clamp,
            ),
            sectionDec != null
                ? Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 12),
                    child: Text(
                      sectionDec!,
                      style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                            fontWeight: FontWeight.w500,
                            // fontSize: 12,
                          ),
                    ),
                  )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
