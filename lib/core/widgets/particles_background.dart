import 'package:aya_abdelmoneim_portfolio/core/helper/app_constants.dart';
import 'package:aya_abdelmoneim_portfolio/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class ParticlesBackground extends StatefulWidget {
  const ParticlesBackground({super.key});

  @override
  State<ParticlesBackground> createState() => _ParticlesBackgroundState();
}

class _ParticlesBackgroundState extends State<ParticlesBackground> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  final Random random = Random();
  final int count = 60;
  late List<Particle> particles;

  @override
  void initState() {
    super.initState();

    particles = List.generate(count, (_) {
      return Particle(
        position: Offset(random.nextDouble() * 800, random.nextDouble() * 1500),
        radius: random.nextDouble() * 3 + 1,
        speed: random.nextDouble() * 0.5 + 0.2,
        opacity: random.nextDouble() * 0.5 + 0.2,
      );
    });

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 100),
    )..addListener(updateParticles);

    controller.repeat();
  }

  void updateParticles() {
    for (var p in particles) {
      p.position = Offset(
        p.position.dx,
        p.position.dy - p.speed,
      );

      if (p.position.dy < 0) {
        p.position = Offset(
          random.nextDouble() * MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height,
        );
      }
    }
    setState(() {});
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ParticlePainter(particles),
      size: Size.infinite,
    );
  }
}

class ParticlePainter extends CustomPainter {
  final List<Particle> particles;

  ParticlePainter(this.particles);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    for (var p in particles) {
      paint.color = AppColors.palettes[AppConstants.randomPallet].first.withOpacity(p.opacity);
      // AppColors.primaryGradient.first.withOpacity(p.opacity);
      canvas.drawCircle(p.position, p.radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class Particle {
  Offset position;
  double radius;
  double speed;
  double opacity;

  Particle({
    required this.position,
    required this.radius,
    required this.speed,
    required this.opacity,
  });
}
