import 'package:aya_abdelmoneim_portfolio/core/helper/app_constants.dart';
import 'package:aya_abdelmoneim_portfolio/core/widgets/custom_avatar.dart';
import 'package:aya_abdelmoneim_portfolio/features/mobile/widgets/mobile_about_section.dart';
import 'package:flutter/material.dart';

class DesktopAboutSection extends StatelessWidget {
  const DesktopAboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: GlobalKeys.homeKey,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: appPadding(true),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 8,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 24),
                        AboutStatement(isCenter: false),
                        SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.only(right: 48),
                          child: AboutDecs(isCenter: false),
                        ),
                        SizedBox(height: 24),
                        SocialBtns(isCenter: false),
                        SizedBox(height: 24),
                        AboutBtns(isCenter: false),
                      ],
                    ),
                  ),
                  Spacer(),
                  Expanded(flex: 4, child: CustomAvatar()) // ),.fadeInRight(),
                ],
              ),
            ),
          ),
          SizedBox(height: 32),
          const DownArrowAnimation(),
        ],
      ),
    );
  }
}
