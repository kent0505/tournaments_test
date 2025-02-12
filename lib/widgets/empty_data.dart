import 'package:flutter/material.dart';

class EmptyData extends StatelessWidget {
  const EmptyData({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 56,
      ).copyWith(top: 122),
      child: const Text(
        'To create a new tournament bracket tap the "+" button in the bottom part of the screen.',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color(0xff7E8082),
          fontSize: 16,
          fontFamily: 'w400',
        ),
      ),
    );
  }
}
