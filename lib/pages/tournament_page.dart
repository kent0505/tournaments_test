import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/tour/tour_bloc.dart';
import '../core/app_colors.dart';
import '../core/participant.dart';
import '../core/tour.dart';
import '../widgets/main_button.dart';
import '../widgets/participant_choose.dart';
import '../widgets/svg_widget.dart';
import '../widgets/tournament_appbar.dart';

class TournamentPage extends StatefulWidget {
  const TournamentPage({super.key, required this.tour});

  final Tour tour;

  @override
  State<TournamentPage> createState() => _TournamentPageState();
}

class _TournamentPageState extends State<TournamentPage> {
  List<Participant> participants = [];

  String win = '';
  int page = 1;
  int pages = 1;

  bool getActive() {
    final selected = participants.where((element) => element.selected);
    return selected.length == participants.length / 2;
  }

  void onParticipant(Participant value) {
    if (participants.length == 2) win = value.name;
    setState(() {});
  }

  void onNext() {
    if (participants.length == 2) {
      context.read<TourBloc>().add(FinishTour(
            tour: Tour(
              id: widget.tour.id,
              title: widget.tour.title,
              amount: widget.tour.amount,
              participants: widget.tour.participants,
              finished: true,
              winner: win,
            ),
          ));
      Navigator.pop(context);
    } else {
      page++;
      participants.removeWhere((element) => !element.selected);
      for (Participant participant in participants) {
        if (participant.selected) {
          participant.selected = false;
        }
      }
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    participants = widget.tour.participants.map((p) {
      return Participant.clone(p);
    }).toList();
    if (participants.length == 4) pages = 2;
    if (participants.length == 8) pages = 3;
    if (participants.length == 16) pages = 4;
    if (participants.length == 32) pages = 5;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TournamentAppbar(
            title: 'Tournament',
            onShuffle: () {
              participants.shuffle();
              setState(() {});
            },
            active: !participants.any((element) => element.selected),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Text(
                  widget.tour.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: AppColors.accent,
                    fontSize: 20,
                    fontFamily: 'w700',
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Round $page out of $pages',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xff7E8082),
                    fontSize: 12,
                    fontFamily: 'w400',
                  ),
                ),
                const SizedBox(height: 24),
                ...List.generate(
                  participants.length ~/ 2,
                  (i) {
                    return ParticipantChoose(
                      participant1: participants[i * 2],
                      participant2: participants[i * 2 + 1],
                      onPressed: onParticipant,
                    );
                  },
                ),
                Column(
                  children: [
                    if (win.isNotEmpty) ...[
                      const SizedBox(height: 88),
                      const SvgWidget('assets/win.svg'),
                      const SizedBox(height: 22),
                      Text(
                        '$win WON',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'w700',
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 106,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: AppColors.main,
              boxShadow: [
                BoxShadow(
                  blurRadius: 8,
                  color: const Color(0xff3786E5).withOpacity(0.24),
                ),
              ],
            ),
            child: Column(
              children: [
                const SizedBox(height: 20),
                MainButton(
                  title: participants.length == 2 ? 'Finish' : 'Next round',
                  active: getActive(),
                  notActiveColor: const Color(0xff262D38),
                  onPressed: onNext,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
