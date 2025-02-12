import 'package:flutter/material.dart';

import '../core/app_colors.dart';
import '../pages/add_tournament_page.dart';
import 'button.dart';

class AddButton extends StatelessWidget {
  const AddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 16,
      bottom: 34,
      child: Container(
        height: 52,
        width: 128,
        decoration: BoxDecoration(
          color: AppColors.accent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Button(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return const AddTournamentPage();
              },
            ));
          },
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add_rounded,
                color: Colors.white,
                size: 40,
              ),
              SizedBox(width: 6),
              Text(
                'ADD',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: 'w700',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
