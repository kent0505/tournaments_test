import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/tour/tour_bloc.dart';
import '../widgets/loading_widget.dart';

import 'home_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<TourBloc, TourState>(
        listener: (context, state) {
          if (state is ToursLoaded) {
            if (context.mounted) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const HomePage();
                  },
                ),
                (route) => false,
              );
            }
          }
        },
        builder: (context, state) {
          return Center(
            child: LoadingWidget(active: state is! ToursLoaded),
          );
        },
      ),
    );
  }
}
