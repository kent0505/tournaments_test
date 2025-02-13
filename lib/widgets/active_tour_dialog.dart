import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/tour/tour_bloc.dart';
import '../core/tour.dart';
import '../pages/tournament_page.dart';
import 'dialog_button.dart';
import 'divider_widget.dart';

class ActiveTourDialog extends StatefulWidget {
  const ActiveTourDialog({super.key, required this.tour});

  final Tour tour;

  @override
  State<ActiveTourDialog> createState() => ActiveTourDialogState();
}

class ActiveTourDialogState extends State<ActiveTourDialog> {
  final controller = TextEditingController();
  bool edit = false;
  bool delete = false;

  @override
  void initState() {
    super.initState();
    controller.text = widget.tour.title;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

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
            if (edit) ...[
              const Text(
                'EDIT NAME',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: 'w700',
                ),
              ),
              const SizedBox(height: 14),
              _Field(controller: controller),
              const SizedBox(height: 16),
              DialogButton(
                onPressed: () {
                  context.read<TourBloc>().add(EditTitle(
                        id: widget.tour.id,
                        title: controller.text,
                      ));
                  Navigator.pop(context);
                },
                title: 'Save',
              ),
              const DividerWidget(),
              DialogButton(
                onPressed: () {
                  edit = false;
                  setState(() {});
                },
                title: 'Cancel',
              ),
            ] else if (delete) ...[
              const SizedBox(height: 12),
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
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return TournamentPage(tour: widget.tour);
                    },
                  ));
                },
                title: 'Open tournament',
              ),
              const DividerWidget(),
              DialogButton(
                onPressed: () => setState(() => edit = true),
                title: 'Edit name',
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

class _Field extends StatelessWidget {
  const _Field({required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      decoration: BoxDecoration(
        color: const Color(0xff262D38),
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          width: 1,
          color: const Color(0xff313344),
        ),
      ),
      child: TextField(
        controller: controller,
        inputFormatters: [LengthLimitingTextInputFormatter(20)],
        textCapitalization: TextCapitalization.sentences,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 17,
          fontFamily: 'w700',
        ),
        decoration: const InputDecoration(
          hintText: 'Title',
          contentPadding: EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 0,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          hintStyle: TextStyle(
            color: Color(0xff8B8E93),
            fontSize: 17,
            fontFamily: 'w400',
          ),
        ),
      ),
    );
  }
}
