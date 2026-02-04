import 'package:aya_abdelmoneim_portfolio/core/helper/app_constants.dart';
import 'package:flutter/material.dart';

class CustomAvatar extends StatelessWidget {
  const CustomAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return FittedBox(
      child: Stack(
        alignment: Alignment.bottomCenter,
        // clipBehavior: Clip.none,
        children: [
          Container(
            width: size.width * 0.36,
            height: size.width * 0.36,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: AppConstants.randomColors,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Positioned(
            bottom: -1,
            child: ClipOval(
              child: Center(
                child: Image.asset(
                  "assets/images/me.png",
                  width: size.width * 0.3,
                  height: size.width * 0.3,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
