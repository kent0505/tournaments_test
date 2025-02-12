import 'package:flutter/material.dart';

import 'button.dart';
import 'svg_widget.dart';

class TournamentAppbar extends StatelessWidget {
  const TournamentAppbar({
    super.key,
    required this.title,
    required this.onShuffle,
    required this.active,
  });

  final String title;
  final VoidCallback onShuffle;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 12 + MediaQuery.of(context).viewPadding.top,
        bottom: 12,
      ),
      child: Row(
        children: [
          const SizedBox(width: 16),
          Button(
            onPressed: Navigator.of(context).pop,
            child: const SvgWidget('assets/back.svg'),
          ),
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'w700',
              ),
            ),
          ),
          Button(
            onPressed: onShuffle,
            child: SvgWidget(
              'assets/shuffle.svg',
              color: active ? Colors.white : const Color(0xff7E8082),
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
    );
  }
}
