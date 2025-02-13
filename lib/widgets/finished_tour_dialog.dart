import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/tour/tour_bloc.dart';
import '../core/tour.dart';
import '../pages/tournament_page.dart';
import 'dialog_button.dart';
import 'divider_widget.dart';

class FinishedTourDialog extends StatefulWidget {
  const FinishedTourDialog({super.key, required this.tour});

  final Tour tour;

  @override
  State<FinishedTourDialog> createState() => FinishedTourDialogState();
}

class FinishedTourDialogState extends State<FinishedTourDialog> {
  bool restart = false;
  bool delete = false;

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
            if (restart) ...[
              const SizedBox(height: 12),
              const Text(
                'RESTART TOURNAMENT',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: 'w700',
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Do you want to restart this tournament? All results will be reset, and the status will be changed to active.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'w400',
                ),
              ),
              const SizedBox(height: 12),
              const DividerWidget(),
              DialogButton(
                onPressed: () {
                  widget.tour.finished = false;
                  widget.tour.winner = '';
                  context.read<TourBloc>().add(UpdateTour());
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return TournamentPage(tour: widget.tour);
                    },
                  ));
                },
                title: 'Restart',
                color: const Color(0xffFF0000),
              ),
              const DividerWidget(),
              DialogButton(
                onPressed: () {
                  restart = false;
                  setState(() {});
                },
                title: 'Cancel',
              ),
            ] else if (delete) ...[
              const Text(
                'DELETE TOURNAMENT',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: 'w700',
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Are you sure you want to delete this tournament? Please confirm your action.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'w400',
                ),
              ),
              const SizedBox(height: 12),
              const DividerWidget(),
              DialogButton(
                onPressed: () {
                  context.read<TourBloc>().add(DeleteTour(tour: widget.tour));
                  Navigator.pop(context);
                },
                title: 'Confirm',
                color: const Color(0xffFF0000),
              ),
              const DividerWidget(),
              DialogButton(
                onPressed: () {
                  delete = false;
                  setState(() {});
                },
                title: 'Cancel',
              ),
            ] else ...[
              DialogButton(
                onPressed: () => setState(() => restart = true),
                title: 'Restart tournament',
              ),
              const DividerWidget(),
              DialogButton(
                onPressed: () {},
                title: 'Share result',
              ),
              const DividerWidget(),
              DialogButton(
                onPressed: () => setState(() => delete = true),
                title: 'Delete tournament',
                color: const Color(0xffFF0000),
              ),
              const DividerWidget(),
              DialogButton(
                onPressed: Navigator.of(context).pop,
                title: 'Cancel',
              ),
            ]
          ],
        ),
      ),
    );
  }
}
