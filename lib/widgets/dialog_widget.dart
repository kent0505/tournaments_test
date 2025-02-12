import 'package:flutter/material.dart';

import 'button.dart';

class DialogWidget extends StatelessWidget {
  const DialogWidget({
    super.key,
    required this.title,
    required this.description,
    required this.buttonTitle,
    this.buttonColor = Colors.white,
    required this.onPressed,
  });

  final String title;
  final String description;
  final String buttonTitle;
  final Color buttonColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 320,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xff202327),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: const Color(0xff3786E5).withOpacity(0.24),
              blurRadius: 8,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: 'w700',
              ),
            ),
            const SizedBox(height: 16),
            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'w400',
              ),
            ),
            const SizedBox(height: 12),
            Container(
              height: 1,
              color: const Color(0xff313344),
            ),
            const SizedBox(height: 4),
            Button(
              onPressed: () {
                Navigator.pop(context);
                onPressed();
              },
              child: Center(
                child: Text(
                  buttonTitle,
                  style: TextStyle(
                    color: buttonColor,
                    fontSize: 16,
                    fontFamily: 'w400',
                  ),
                ),
              ),
            ),
            Container(
              height: 1,
              color: const Color(0xff313344),
            ),
            const SizedBox(height: 4),
            Button(
              onPressed: Navigator.of(context).pop,
              child: const Center(
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'w400',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
