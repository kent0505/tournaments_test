import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/internet/internet_bloc.dart';

import '../core/app_colors.dart';
import 'svg_widget.dart';

class NoInternetDialog extends StatelessWidget {
  const NoInternetDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetBloc, InternetState>(
      listener: (context, state) {
        if (state is InternetSuccess) Navigator.pop(context);
      },
      child: PopScope(
        canPop: false,
        child: Dialog(
          backgroundColor: AppColors.main,
          child: Column(
            children: [
              const Row(),
              const Spacer(),
              Container(
                height: 50,
                width: 268,
                decoration: BoxDecoration(
                  color: const Color(0xff202327),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Row(
                  children: [
                    SizedBox(width: 20),
                    Text(
                      'No internet connection.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'w400',
                      ),
                    ),
                    Spacer(),
                    SvgWidget('assets/refresh.svg'),
                    SizedBox(width: 20),
                  ],
                ),
              ),
              const SizedBox(height: 62),
            ],
          ),
        ),
      ),
    );
  }
}
