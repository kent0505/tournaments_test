import 'package:flutter/material.dart';

import 'app_colors.dart';

final theme = ThemeData(
  useMaterial3: false,
  fontFamily: 'w400',
  brightness: Brightness.dark,
  scaffoldBackgroundColor: AppColors.main,
  // textSelectionTheme: const TextSelectionThemeData(
  //   cursorColor: AppColors.main,
  //   selectionColor: AppColors.main,
  //   selectionHandleColor: AppColors.main,
  // ),
  // colorScheme: ColorScheme.fromSwatch(
  //   accentColor: AppColors.main, // overscroll indicator color
  // ),

  // DIALOG
  dialogBackgroundColor: const Color(0xff202327),
  dialogTheme: const DialogTheme(
    insetPadding: EdgeInsets.zero,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
  ),
);

// const cupertinoTheme = CupertinoThemeData(
//   textTheme: CupertinoTextThemeData(
//     textStyle: TextStyle(
//       fontFamily: 'w600',
//       color: Colors.black,
//     ),
//     dateTimePickerTextStyle: TextStyle(
//       color: Colors.white,
//       fontSize: 24,
//       fontFamily: 'w600',
//     ),
//   ),
// );
