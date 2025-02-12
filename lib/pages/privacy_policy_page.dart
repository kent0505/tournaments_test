import 'package:flutter/material.dart';

import '../widgets/page_title.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const PageTitle(title: 'PRIVACY POLICY'),
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
