import 'package:flutter/material.dart';

import 'button.dart';
import 'svg_widget.dart';

class PageTitle extends StatelessWidget {
  const PageTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 12 + MediaQuery.of(context).viewPadding.top,
        bottom: 12,
      ),
      child: Row(
        children: [
          const SizedBox(width: 16),
          Button(
            onPressed: Navigator.of(context).pop,
            child: const SvgWidget('assets/back.svg'),
          ),
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontFamily: 'w700',
              ),
            ),
          ),
          const SizedBox(width: 60),
        ],
      ),
    );
  }
}
