import 'package:flutter/material.dart';

import '../core/app_colors.dart';
import 'button.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.title,
    this.width,
    this.notActiveColor,
    this.active = true,
    required this.onPressed,
  });

  final String title;
  final double? width;
  final Color? notActiveColor;
  final bool active;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 50,
      width: width,
      decoration: BoxDecoration(
        color: active
            ? AppColors.accent
            : notActiveColor ?? AppColors.accent.withOpacity(0.24),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Button(
        onPressed: active ? onPressed : null,
        child: Center(
          child: Text(
            title.toUpperCase(),
            style: TextStyle(
              color: active ? Colors.white : Colors.white.withOpacity(0.24),
              fontSize: 18,
              fontFamily: 'w700',
            ),
          ),
        ),
      ),
    );
  }
}
