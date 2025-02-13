import 'package:flutter/material.dart';

import 'button.dart';

class DialogButton extends StatelessWidget {
  const DialogButton({
    super.key,
    required this.title,
    this.color = Colors.white,
    required this.onPressed,
  });

  final String title;
  final Color color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Button(
      onPressed: onPressed,
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: color,
            fontSize: 16,
            fontFamily: 'w400',
          ),
        ),
      ),
    );
  }
}
