import 'package:flutter/material.dart';

class HoverGlowText extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final Color glowColor;
  final VoidCallback? onTap;

  const HoverGlowText({
    super.key,
    required this.text,
    this.style,
    this.glowColor = const Color(0xFF00C2FF),
    this.onTap,
  });

  @override
  State<HoverGlowText> createState() => _HoverGlowTextState();
}

class _HoverGlowTextState extends State<HoverGlowText> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    final glow = widget.glowColor;

    return MouseRegion(
      cursor: widget.onTap != null ? SystemMouseCursors.click : SystemMouseCursors.basic,
      onEnter: (_) => setState(() => isHover = true),
      onExit: (_) => setState(() => isHover = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeOut,
          style: (widget.style ?? Theme.of(context).textTheme.bodyLarge!).copyWith(
            color: isHover ? Colors.white : Colors.white70,
            shadows: isHover
                ? [
                    // sharp neon core
                    Shadow(
                      color: glow.withOpacity(0.9),
                      blurRadius: 6,
                    ),
                    // medium glow
                    Shadow(
                      color: glow.withOpacity(0.6),
                      blurRadius: 14,
                    ),
                    // outer soft glow
                    Shadow(
                      color: glow.withOpacity(0.35),
                      blurRadius: 28,
                    ),
                  ]
                : [],
          ),
          child: Text(widget.text),
        ),
      ),
    );
  }
}
