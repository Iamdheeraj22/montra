import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FloatingButtonItem extends StatelessWidget {
  const FloatingButtonItem({
    super.key,
    required this.icon,
    required this.color,
    required this.onPressed,
  });
  final String icon;
  final Color color;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(12),
        constraints: const BoxConstraints(
          minWidth: 56,
          minHeight: 56,
          maxWidth: 56,
          maxHeight: 56,
        ),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(100),
        ),
        child: SvgPicture.asset(
          icon,
          height: 32,
          width: 32,
          colorFilter: const ColorFilter.mode(
            Colors.white,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
