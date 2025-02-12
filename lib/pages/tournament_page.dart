import 'package:flutter/material.dart';

import '../core/app_colors.dart';
import '../core/tour.dart';
import '../widgets/participant_choose.dart';
import '../widgets/tournament_appbar.dart';

class TournamentPage extends StatelessWidget {
  const TournamentPage({
    super.key,
    required this.tour,
  });

  final Tour tour;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TournamentAppbar(
            title: 'Tournament',
            onShuffle: () {},
            active: true,
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Text(
                  tour.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: AppColors.accent,
                    fontSize: 20,
                    fontFamily: 'w700',
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Round 1 out of 4',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff7E8082),
                    fontSize: 12,
                    fontFamily: 'w400',
                  ),
                ),
                const SizedBox(height: 24),
                const ParticipantChoose(
                  participant1: 'Aaa',
                  participant2: 'Bbb',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
