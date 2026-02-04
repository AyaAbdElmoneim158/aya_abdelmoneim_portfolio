import 'package:aya_abdelmoneim_portfolio/core/models/portfolio_data.dart';
import 'package:aya_abdelmoneim_portfolio/portfolio.dart';
import 'package:flutter/material.dart';

loadPortfolioData() async {
  PortfolioData data = await loadPortfolioData();
// List<String> skills = data.skills;
}

void main() {
  runApp(const Portfolio());
}
 /*
 AdaptiveLayout(
              mobileLayout: (context) =>
                  ProjectOverviewMobile(projectDataModel: projectDataModel),
              tabletLayout: (context)=>ProjectOverviewDesktop(projectDataModel: projectDataModel,),
              desktopLayout: (context)=>ProjectOverviewDesktop(projectDataModel: projectDataModel,),
          ),

 AdaptiveLayout(
            mobileLayout: (context) => EducationInfo(),
            tabletLayout: (context)=> FittedBox(child: EducationInfo()),
            desktopLayout: (context)=> FittedBox(child: EducationInfo()),),
   

*/