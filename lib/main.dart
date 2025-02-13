import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/app_colors.dart';
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
        theme: ThemeData(
          useMaterial3: false,
          fontFamily: 'w400',
          brightness: Brightness.dark,
          scaffoldBackgroundColor: AppColors.main,
          dialogBackgroundColor: const Color(0xff202327),
          dialogTheme: const DialogTheme(
            insetPadding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
          ),
        ),
        home: const SplashPage(),
      ),
    );
  }
}
