import 'package:flutter/material.dart';

import '../widgets/page_title.dart';

class TermsOfUsePage extends StatelessWidget {
  const TermsOfUsePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const PageTitle(title: 'TERMS OF USE'),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: const [
                // text
              ],
            ),
          ),
        ],
      ),
    );
  }
}
