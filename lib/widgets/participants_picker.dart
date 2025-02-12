import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../core/app_colors.dart';
import 'button.dart';

class ParticipantsPicker extends StatefulWidget {
  const ParticipantsPicker({
    super.key,
    required this.onPick,
  });

  final void Function(String) onPick;

  @override
  State<ParticipantsPicker> createState() => _ParticipantsPickerState();
}

class _ParticipantsPickerState extends State<ParticipantsPicker> {
  final List<String> options = ['2', '4', '8', '16', '32'];
  late FixedExtentScrollController scrollController;

  String picked = '8';

  @override
  void initState() {
    super.initState();
    scrollController = FixedExtentScrollController(initialItem: 2);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.main.withOpacity(0.8),
      height: 292,
      child: Column(
        children: [
          const SizedBox(height: 18),
          Row(
            children: [
              const SizedBox(width: 16),
              Button(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'w400',
                    ),
                  ),
                ),
              ),
              const Expanded(
                child: Text(
                  'Number of\nparticipants',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontFamily: 'w700',
                  ),
                ),
              ),
              Button(
                onPressed: () {
                  Navigator.pop(context);
                  widget.onPick(picked);
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Done',
                    style: TextStyle(
                      color: Color(0xff3186E2),
                      fontSize: 16,
                      fontFamily: 'w400',
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
            ],
          ),
          const SizedBox(height: 18),
          Container(
            height: 174,
            margin: const EdgeInsets.symmetric(horizontal: 34),
            child: CupertinoPicker(
              scrollController: scrollController,
              itemExtent: 32,
              squeeze: 1.3,
              useMagnifier: false,
              onSelectedItemChanged: (value) {
                picked = options[value];
              },
              children: const [
                _PickerText(title: '2', active: true),
                _PickerText(title: '4', active: true),
                _PickerText(title: '8', active: true),
                _PickerText(title: '16', active: true),
                _PickerText(title: '32', active: true),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PickerText extends StatelessWidget {
  const _PickerText({
    required this.title,
    required this.active,
  });

  final String title;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: TextStyle(
          color: active ? Colors.white : Colors.white.withOpacity(0.35),
        ),
      ),
    );
  }
}
