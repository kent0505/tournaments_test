import 'package:flutter/material.dart';

import '../core/app_colors.dart';
import '../core/tour.dart';
import 'active_tour_dialog.dart';
import 'button.dart';
import 'finished_tour_dialog.dart';

class TourCard extends StatelessWidget {
  const TourCard({super.key, required this.tour});

  final Tour tour;

  @override
  Widget build(BuildContext context) {
    return Button(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return tour.finished
                ? FinishedTourDialog(tour: tour)
                : ActiveTourDialog(tour: tour);
          },
        );
      },
      child: Container(
        height: tour.finished ? 92 : 68,
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            width: 1,
            color: AppColors.accent,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Row(
                children: [
                  Text(
                    tour.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'w700',
                    ),
                  ),
                ],
              ),
            ),
            if (tour.winner.isNotEmpty)
              Text(
                'Winner: ${tour.winner}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'w400',
                ),
              ),
            const SizedBox(height: 4),
            const Text(
              'Last used: 29 minutes ago',
              style: TextStyle(
                color: Color(0xff7E8082),
                fontSize: 12,
                fontFamily: 'w400',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
