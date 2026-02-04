import 'package:aya_abdelmoneim_portfolio/core/theme/app_colors.dart';
import 'package:aya_abdelmoneim_portfolio/features/desktop/desktop_layout.dart';
import 'package:aya_abdelmoneim_portfolio/features/mobile/mobile_layout.dart';
import 'package:flutter/material.dart';

class Portfolio extends StatelessWidget {
  const Portfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        textTheme: ThemeData.dark().textTheme.apply(fontFamily: 'Poppins'),
        scaffoldBackgroundColor: AppColors.lightBackGroundColor,
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.cardColor,
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AdaptiveLayout(mobileLayout: MobileLayout(), desktopLayout: DesktopLayout(),);
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 1000) {
            return const MobileLayout();
          } else {
            return const DesktopLayout();
          }
        },
      ),
    );
  }
}
