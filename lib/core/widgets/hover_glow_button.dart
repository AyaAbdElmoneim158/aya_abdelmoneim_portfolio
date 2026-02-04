import 'package:flutter/material.dart';

class HoverGlowButton extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final Color glowColor;
  final bool hasBorder;
  final bool isRound;

  const HoverGlowButton({
    super.key,
    required this.child,
    this.onTap,
    this.glowColor = const Color(0xFF00C2FF),
    this.hasBorder = true,
    this.isRound = false,
  });

  @override
  State<HoverGlowButton> createState() => _HoverGlowButtonState();
}

class _HoverGlowButtonState extends State<HoverGlowButton> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    final glowColor = widget.glowColor;

    return MouseRegion(
      onEnter: (_) => setState(() => isHover = true),
      onExit: (_) => setState(() => isHover = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: widget.isRound ? EdgeInsets.zero : const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          decoration: BoxDecoration(
            shape: widget.isRound ? BoxShape.circle : BoxShape.rectangle,
            color: !widget.hasBorder ? null : const Color(0xff2A2A2A), // dark background
            borderRadius: widget.isRound ? null : BorderRadius.circular(14),
            border: !widget.hasBorder ? null : Border.all(color: isHover ? glowColor : Colors.white24, width: 1.2),
            boxShadow: isHover
                ? [
                    BoxShadow(
                      color: glowColor.withOpacity(0.45),
                      blurRadius: !widget.hasBorder ? 6 : 12,
                      spreadRadius: 1,
                    ),
                    BoxShadow(
                      color: glowColor.withOpacity(0.2),
                      blurRadius: !widget.hasBorder ? 12 : 24,
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
