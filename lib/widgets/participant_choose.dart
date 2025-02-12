import 'package:flutter/material.dart';

import '../core/app_colors.dart';
import 'button.dart';

class ParticipantChoose extends StatelessWidget {
  const ParticipantChoose({
    super.key,
    required this.participant1,
    required this.participant2,
  });

  final String participant1;
  final String participant2;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Row(
          children: [
            _Participant(
              title: participant1,
              active: true,
              onPressed: (p0) {},
            ),
            const SizedBox(width: 20),
            _Participant(
              title: participant2,
              active: false,
              onPressed: (p0) {},
            ),
          ],
        ),
        Container(
          height: 30,
          width: 76,
          decoration: BoxDecoration(
            // color: AppColors.accent,
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: const Center(
            child: Text(
              'VS',
              style: TextStyle(
                // color: Colors.white,
                color: Color(0xff262D38),
                fontSize: 17,
                fontFamily: 'w700',
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _Participant extends StatelessWidget {
  const _Participant({
    required this.title,
    required this.active,
    required this.onPressed,
  });

  final String title;
  final bool active;
  final void Function(String) onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 75,
        decoration: BoxDecoration(
          color: active ? AppColors.accent : null,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            width: 1,
            color: AppColors.accent,
          ),
        ),
        child: Button(
          onPressed: () {
            onPressed(title);
          },
          child: Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontFamily: 'w700',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
