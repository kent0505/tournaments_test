import 'package:flutter/material.dart';

import '../core/app_colors.dart';
import '../core/participant.dart';
import 'button.dart';

class ParticipantChoose extends StatelessWidget {
  const ParticipantChoose({
    super.key,
    required this.participant1,
    required this.participant2,
    required this.onPressed,
  });

  final Participant participant1;
  final Participant participant2;
  final void Function(Participant) onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            children: [
              _Participant(
                participant1: participant1,
                participant2: participant2,
                onPressed: onPressed,
              ),
              const SizedBox(width: 20),
              _Participant(
                participant1: participant2,
                participant2: participant1,
                onPressed: onPressed,
              ),
            ],
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: 30,
            width: 76,
            decoration: BoxDecoration(
              color: participant1.selected || participant2.selected
                  ? Colors.white
                  : AppColors.accent,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
              child: Text(
                'VS',
                style: TextStyle(
                  color: participant1.selected || participant2.selected
                      ? const Color(0xff262D38)
                      : Colors.white,
                  fontSize: 17,
                  fontFamily: 'w700',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Participant extends StatelessWidget {
  const _Participant({
    required this.participant1,
    required this.participant2,
    required this.onPressed,
  });

  final Participant participant1;
  final Participant participant2;
  final void Function(Participant) onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: 75,
        decoration: BoxDecoration(
          color: participant1.selected ? AppColors.accent : null,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            width: 1,
            color: AppColors.accent,
          ),
        ),
        child: Button(
          onPressed: () {
            participant1.selected = !participant1.selected;
            participant2.selected = false;
            onPressed(participant1);
          },
          child: Center(
            child: Text(
              participant1.name,
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
