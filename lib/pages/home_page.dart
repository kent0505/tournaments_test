import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/tour/tour_bloc.dart';
import '../core/utils.dart';
import '../widgets/add_button.dart';
import '../widgets/button.dart';
import '../widgets/empty_data.dart';
import '../widgets/internet_widget.dart';
import '../widgets/svg_widget.dart';
import '../widgets/tab_widget.dart';
import '../widgets/tour_card.dart';
import 'settings_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: InternetWidget(
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(height: 12 + MediaQuery.of(context).viewPadding.top),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(width: 64),
                    const Spacer(),
                    const Text(
                      'TOURNAMENT\nBRACKETS',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontFamily: 'w700',
                      ),
                    ),
                    const Spacer(),
                    Button(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const SettingsPage();
                          },
                        ));
                      },
                      child: const SvgWidget('assets/settings.svg'),
                    ),
                    const SizedBox(width: 20),
                  ],
                ),
                const SizedBox(height: 12),
                BlocBuilder<TourBloc, TourState>(
                  builder: (context, state) {
                    if (state is ToursLoaded) {
                      if (toursList.isEmpty) {
                        return const EmptyData();
                      }

                      final notFinished =
                          toursList.where((tour) => !tour.finished).toList();
                      final finished =
                          toursList.where((tour) => tour.finished).toList();

                      return Expanded(
                        child: TabWidget(
                          titles: const ['ACTIVE', 'FINISHED'],
                          pages: [
                            ListView.builder(
                              padding: const EdgeInsets.all(16),
                              itemCount: notFinished.length,
                              itemBuilder: (context, index) {
                                return TourCard(tour: notFinished[index]);
                              },
                            ),
                            ListView.builder(
                              padding: const EdgeInsets.all(16),
                              itemCount: finished.length,
                              itemBuilder: (context, index) {
                                return TourCard(tour: finished[index]);
                              },
                            ),
                          ],
                        ),
                      );
                    }

                    return Container();
                  },
                ),
              ],
            ),
            const AddButton(),
          ],
        ),
      ),
    );
  }
}
