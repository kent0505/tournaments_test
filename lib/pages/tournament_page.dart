import 'package:flutter/material.dart';

import '../core/app_colors.dart';
import '../core/participant.dart';
import '../core/tour.dart';
import '../widgets/participant_choose.dart';
import '../widgets/tournament_appbar.dart';

class TournamentPage extends StatelessWidget {
  const TournamentPage({super.key, required this.tour});

  final Tour tour;

  @override
  Widget build(BuildContext context) {
    final participants = tour.participants.cast<Participant>();
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
                ParticipantChoose(
                  participant1: participants[0],
                  participant2: participants[1],
                ),
                if (participants.length >= 4) ...[
                  ParticipantChoose(
                    participant1: participants[2],
                    participant2: participants[3],
                  ),
                  if (tour.participants.length >= 8) ...[
                    ParticipantChoose(
                      participant1: participants[4],
                      participant2: participants[5],
                    ),
                    ParticipantChoose(
                      participant1: participants[6],
                      participant2: participants[7],
                    ),
                    if (tour.participants.length >= 16) ...[
                      ParticipantChoose(
                        participant1: participants[8],
                        participant2: participants[9],
                      ),
                      ParticipantChoose(
                        participant1: participants[10],
                        participant2: participants[11],
                      ),
                      ParticipantChoose(
                        participant1: participants[12],
                        participant2: participants[13],
                      ),
                      ParticipantChoose(
                        participant1: participants[14],
                        participant2: participants[15],
                      ),
                      if (tour.participants.length == 31) ...[
                        ParticipantChoose(
                          participant1: participants[16],
                          participant2: participants[17],
                        ),
                        ParticipantChoose(
                          participant1: participants[18],
                          participant2: participants[19],
                        ),
                        ParticipantChoose(
                          participant1: participants[20],
                          participant2: participants[21],
                        ),
                        ParticipantChoose(
                          participant1: participants[22],
                          participant2: participants[23],
                        ),
                        ParticipantChoose(
                          participant1: participants[24],
                          participant2: participants[25],
                        ),
                        ParticipantChoose(
                          participant1: participants[26],
                          participant2: participants[27],
                        ),
                        ParticipantChoose(
                          participant1: participants[28],
                          participant2: participants[29],
                        ),
                        ParticipantChoose(
                          participant1: participants[30],
                          participant2: participants[31],
                        ),
                      ],
                    ],
                  ],
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
