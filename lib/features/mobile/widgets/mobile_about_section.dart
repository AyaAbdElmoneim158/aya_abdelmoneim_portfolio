import 'package:aya_abdelmoneim_portfolio/core/helper/app_constants.dart';
import 'package:aya_abdelmoneim_portfolio/core/models/about_model.dart';
import 'package:aya_abdelmoneim_portfolio/core/theme/app_colors.dart';
import 'package:aya_abdelmoneim_portfolio/core/widgets/custom_avatar.dart';
import 'package:aya_abdelmoneim_portfolio/core/widgets/gradient_section_header.dart';
import 'package:aya_abdelmoneim_portfolio/core/widgets/hover_glow_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:text_gradiate/text_gradiate.dart';
import 'package:url_launcher/url_launcher.dart';

class MobileAboutSection extends StatelessWidget {
  const MobileAboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: GlobalKeys.homeKey,
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: appPadding(false),
        child: Stack(
          clipBehavior: Clip.hardEdge,
          children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomAvatar(),
                  Column(
                    children: [
                      SizedBox(height: 24),
                      AboutStatement(),
                      AboutDecs(),
                      SizedBox(height: 24),
                      AboutBtns(),
                      SizedBox(height: 48),
                      SocialBtns(),
                      SizedBox(height: 16),
                      const DownArrowAnimation(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Todo: split
class SocialBtns extends StatelessWidget {
  const SocialBtns({super.key, this.isCenter = true});
  final bool isCenter;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      mainAxisAlignment: isCenter ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: [
        HoverGlowButton(
          hasBorder: false,
          isRound: true,
          glowColor: AppConstants.randomColors.first,
          child: SocialIcon(
            assetName: "assets/icons/email.svg",
            onTap: () async {
              final Uri emailUri = Uri(
                scheme: 'mailto',
                path: 'ayhb756@gmail.com',
                query: Uri.encodeQueryComponent(
                  'subject=Hello Aya&body=Hi Aya,',
                ),
              );

              if (!await launchUrl(
                emailUri,
                mode: LaunchMode.externalApplication,
              )) {
                debugPrint('Could not launch email');
              }
            },
          ),
        ),
        HoverGlowButton(
          hasBorder: false,
          isRound: true,
          glowColor: AppConstants.randomColors.first,
          child: SocialIcon(
            assetName: "assets/icons/github.svg",
            onTap: () async {
              final Uri url = Uri.parse("https://github.com/AyaAbdElmoneim158");
              if (await canLaunchUrl(url)) {
                await launchUrl(url, mode: LaunchMode.externalApplication);
              }
            },
          ),
        ),
        HoverGlowButton(
          hasBorder: false,
          isRound: true,
          glowColor: AppConstants.randomColors.first,
          child: SocialIcon(
            assetName: "assets/icons/linkedin.svg",
            onTap: () async {
              final Uri url = Uri.parse("https://linkedin.com/in/aya-abdelmoneim");
              if (await canLaunchUrl(url)) {
                await launchUrl(url, mode: LaunchMode.externalApplication);
              }
            },
          ),
        ),
      ],
    );
  }
}

class AboutStatement extends StatelessWidget {
  const AboutStatement({super.key, this.isCenter = true});
  final bool isCenter;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: isCenter ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: [
        Align(
          alignment: isCenter ? Alignment.center : Alignment.centerLeft,
          child: Text(
            "I write code and",
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.w800,
                  color: AppColors.primary,
                  height: 0.4,
                ),
          ),
        ),
        Row(
          mainAxisAlignment: isCenter ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: [
            Text(
              "craft products",
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.w800,
                    height: 0.4,
                    color: AppColors.primary,
                  ),
            ),
            GradientSectionHeader(
              sectionName: " people love!",
              gradient: AppConstants.randomColors,
              fromRightToLeft: true,
            ),
          ],
        ),
      ],
    );
  }
}

class AboutStatement2 extends StatelessWidget {
  const AboutStatement2({super.key, required this.about, this.isCenter = true});
  final bool isCenter;
  final AboutModel about;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: isCenter ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: [
        Align(
          alignment: isCenter ? Alignment.center : Alignment.centerLeft,
          child: Text(
            "I do code and",
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.w800,
                  color: AppColors.primary,
                  height: 0.4,
                ),
          ),
        ),
        Row(
          mainAxisAlignment: isCenter ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: [
            Text(
              "create",
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.w800,
                    height: 0.4,
                    color: AppColors.primary,
                  ),
            ),
            GradientSectionHeader(
              sectionName: " amazing apps!",
              gradient: AppConstants.randomColors,
              fromRightToLeft: true,
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          about.title,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w500,
                color: AppColors.secondary,
              ),
          textAlign: isCenter ? TextAlign.center : TextAlign.left,
        ),
      ],
    );
  }
}

class AboutBtns extends StatelessWidget {
  const AboutBtns({super.key, this.isCenter = true});
  final bool isCenter;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 12,
      mainAxisAlignment: isCenter ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: [
        HoverGlowButton(
          onTap: () {
            Scrollable.ensureVisible(
              GlobalKeys.projectsKey.currentContext!,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
            );
          },
          glowColor: AppConstants.randomColors.first,
          child: Text(
            "View my projects",
            style: TextStyle(color: Colors.white),
          ),
        ),
        HoverGlowButton(
          glowColor: AppConstants.randomColors.last,
          onTap: () async {
            final Uri url = Uri.parse("https://flowcv.com/resume/s8a1k5pal1");
            if (await canLaunchUrl(url)) {
              await launchUrl(url, mode: LaunchMode.externalApplication);
            }
          }, //Todo: download-functionality
          child: Row(
            spacing: 6,
            children: [
              Icon(
                Icons.download_rounded,
                color: Colors.white,
                size: 16,
              ),
              Text(
                "Download CV",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class AboutDecs extends StatelessWidget {
  const AboutDecs({super.key, this.isCenter = true});
  final bool isCenter;
  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: isCenter ? TextAlign.center : TextAlign.left,
      text: TextSpan(
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontWeight: FontWeight.w300,
              // fontSize: 12,
              color: AppColors.secondary,
            ),
        children: [
          const TextSpan(text: "Hi, I’m "),
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: TextGradiate(
              text: Text(
                "Aya Abdelmoneim, ",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.w500,
                      // fontSize: 12,
                      color: AppColors.secondary,
                    ),
              ),
              colors: AppConstants.randomColors,
            ),
          ),
          const TextSpan(
            text: "a mobile software engineer specializing in Flutter and Dart. "
                "I create high-performance apps with smooth UI/UX, seamless API integration, "
                "and scalable architectures like MVVM, Riverpod, and Bloc. "
                "I’m passionate about building products that users love and mentoring developers to grow.",
          ),
        ],
      ),
    );
  }
}

class AboutDecs2 extends StatelessWidget {
  const AboutDecs2({super.key, required this.about, this.isCenter = true});
  final bool isCenter;
  final AboutModel about;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: isCenter ? TextAlign.center : TextAlign.left,
      text: TextSpan(
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontWeight: FontWeight.w300,
              color: AppColors.secondary,
            ),
        children: [
          const TextSpan(text: "Hi, I'm "),
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: TextGradiate(
              text: Text(
                about.name,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.secondary,
                    ),
              ),
              colors: AppConstants.randomColors,
            ),
          ),
          TextSpan(
            text: " — ${about.summary}",
          ),
        ],
      ),
    );
  }
}

class SocialIcon extends StatelessWidget {
  const SocialIcon({super.key, this.onTap, required this.assetName});
  final void Function()? onTap;
  final String assetName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: AppConstants.randomColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SvgPicture.asset(
          assetName,
          color: AppColors.primary,
          height: 24,
        ),
      ),
    );
  }
}

class DownArrowAnimation extends StatefulWidget {
  const DownArrowAnimation({super.key});

  @override
  State<DownArrowAnimation> createState() => _DownArrowAnimationState();
}

class _DownArrowAnimationState extends State<DownArrowAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);

    _animation = Tween<double>(
      begin: 0,
      end: 12, // movement distance
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Scrollable.ensureVisible(
          GlobalKeys.experienceKey.currentContext!,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
        );
      },
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0, _animation.value),
            child: child,
          );
        },
        child: Icon(
          Icons.keyboard_double_arrow_down_rounded,
          color: AppConstants.randomColors.last,
          size: 32,
        ),
      ),
    );
  }
}
