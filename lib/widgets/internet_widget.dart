import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/internet/internet_bloc.dart';
import 'no_internet_dialog.dart';

class InternetWidget extends StatelessWidget {
  const InternetWidget({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetBloc, InternetState>(
      listener: (context, state) {
        if (state is InternetFailure) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return const NoInternetDialog();
            },
          );
        }
      },
      child: child,
    );
  }
}
