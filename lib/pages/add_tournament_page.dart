import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/tour/tour_bloc.dart';
import '../core/app_colors.dart';
import '../core/tour.dart';
import '../core/utils.dart';
import '../widgets/dialog_widget.dart';
import '../widgets/main_button.dart';
import '../widgets/participants_picker.dart';
import '../widgets/tournament_appbar.dart';
import '../widgets/txt_field.dart';

class AddTournamentPage extends StatefulWidget {
  const AddTournamentPage({super.key});

  @override
  State<AddTournamentPage> createState() => _AddTournamentPageState();
}

class _AddTournamentPageState extends State<AddTournamentPage> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  List<TextEditingController> participantControllers = [];

  bool active = false;
  bool canPop = true;

  void onShuffle() {
    setState(() {
      participantControllers.shuffle();
    });
  }

  void onChanged(String value) {
    setState(() {
      canPop = false;
      active = [
        controller1,
        controller2,
        ...participantControllers,
      ].every((element) => element.text.isNotEmpty);
    });
  }

  void onPick(String value) {
    setState(() {
      controller2.text = value;
      participantControllers = List.generate(
        int.parse(value),
        (index) {
          return TextEditingController();
        },
      );
    });
  }

  // void onPop() {
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return DialogWidget(
  //         title: 'DO YOU WANT TO EXIT?',
  //         description: 'Are you sure? After exiting unsaved data will be lost.',
  //         buttonTitle: 'Confirm',
  //         onPressed: () {
  //           setState(() {
  //             canPop = true;
  //           });
  //           Navigator.pop(context);
  //         },
  //       );
  //     },
  //   );
  // }

  void onSave() {
    context.read<TourBloc>().add(
          AddTour(
            tour: Tour(
              id: getTimestamp(),
              title: controller1.text,
              amount: controller2.text,
              participants: List.generate(
                participantControllers.length,
                (index) {
                  return participantControllers[index].text;
                },
              ),
            ),
          ),
        );
    Navigator.pop(context);
  }

  void onStart() {
    onSave();
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    for (TextEditingController controller in participantControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          TournamentAppbar(
            title: 'New Tournament',
            onShuffle: onShuffle,
            active: active,
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                TxtField(
                  controller: controller1,
                  labelText: 'Tournament name',
                  hintText: 'Enter tournament name',
                  onChanged: onChanged,
                ),
                const SizedBox(height: 12),
                TxtField(
                  controller: controller2,
                  labelText: 'Number of participants',
                  hintText: '8',
                  readOnly: true,
                  onTap: () {
                    controller2.text.isEmpty
                        ? showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return ParticipantsPicker(onPick: onPick);
                            },
                          )
                        : showDialog(
                            context: context,
                            builder: (context) {
                              return DialogWidget(
                                title:
                                    'CHANGE THE NUMBER OF PARTICIPANTS FOR TOURNAMENT?',
                                description:
                                    'Previously entered participants names will be reset and you need to start entering from the beginning. Please confirm your action.',
                                buttonTitle: 'Confirm',
                                onPressed: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return ParticipantsPicker(onPick: onPick);
                                    },
                                  );
                                },
                              );
                            },
                          );
                  },
                ),
                const SizedBox(height: 20),
                if (participantControllers.isNotEmpty) ...[
                  const Text(
                    'Participants',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'w700',
                    ),
                  ),
                  const SizedBox(height: 12),
                  ...List.generate(
                    participantControllers.length,
                    (index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: TxtField(
                          controller: participantControllers[index],
                          labelText: 'Participants ${index + 1}',
                          hintText: 'Enter participants name',
                          onChanged: onChanged,
                        ),
                      );
                    },
                  ),
                ],
              ],
            ),
          ),
          Container(
            height: 182,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: AppColors.main,
              boxShadow: [
                BoxShadow(
                  blurRadius: 8,
                  color: const Color(0xff3786E5).withValues(alpha: 0.24),
                ),
              ],
            ),
            child: Column(
              children: [
                const SizedBox(height: 20),
                MainButton(
                  title: 'Save',
                  active: active,
                  notActiveColor: const Color(0xff262D38),
                  onPressed: onSave,
                ),
                const SizedBox(height: 12),
                MainButton(
                  title: 'Save & Start tournament',
                  active: active,
                  notActiveColor: const Color(0xff262D38),
                  onPressed: onStart,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
