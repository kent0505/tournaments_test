import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/themes.dart';
import 'blocs/tour/tour_bloc.dart';
import 'blocs/internet/internet_bloc.dart';
import 'pages/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) {
          return InternetBloc()..add(CheckInternet());
        }),
        BlocProvider(create: (context) {
          return TourBloc()..add(LoadTours());
        }),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme,
        home: const SplashPage(),
      ),
    );
  }
}
