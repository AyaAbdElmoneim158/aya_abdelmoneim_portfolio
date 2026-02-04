import 'package:flutter/material.dart';

class HoverLiftCard extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final Color glowColor;

  const HoverLiftCard({
    super.key,
    required this.child,
    this.onTap,
    this.glowColor = const Color(0xFF00C2FF),
  });

  @override
  State<HoverLiftCard> createState() => _HoverLiftCardState();
}

class _HoverLiftCardState extends State<HoverLiftCard> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    // const primary = Color(0xFF00C2FF); // your --primary
    final glowColor = widget.glowColor;

    return MouseRegion(
      onEnter: (_) => setState(() => isHover = true),
      onExit: (_) => setState(() => isHover = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeOut,
          transform: isHover ? (Matrix4.identity()..translate(0.0, -4.0)) : Matrix4.identity(),
          decoration: BoxDecoration(
            color: const Color(0xff2A2A2A),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isHover ? glowColor.withOpacity(0.5) : Colors.white12,
            ),
            boxShadow: isHover
                ? [
                    BoxShadow(
                      offset: const Offset(0, 10),
                      blurRadius: 40,
                      color: glowColor.withOpacity(0.15),
                    ),
                  ]
                : [],
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
