import 'package:flutter/material.dart';
import 'package:app_settings/app_settings.dart';

import '../widgets/button.dart';
import '../widgets/dialog_widget.dart';
import '../widgets/page_title.dart';
import '../widgets/svg_widget.dart';
import 'privacy_policy_page.dart';
import 'terms_of_use_page.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const PageTitle(title: 'SETTINGS'),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _SettingsTile(
                  id: 1,
                  title: 'Notifications',
                  onPressed: () async {
                    AppSettings.openAppSettings(
                      type: AppSettingsType.notification,
                    );
                  },
                ),
                _SettingsTile(
                  id: 2,
                  title: 'Delete local date',
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return DialogWidget(
                          title: 'DELETE LOCAL DATA?',
                          description:
                              'Are you sure? The data of the application will be lost. Please confirm your action.',
                          buttonTitle: 'Delete data',
                          buttonColor: const Color(0xffFF0000),
                          onPressed: () {},
                        );
                      },
                    );
                  },
                ),
                _SettingsTile(
                  id: 3,
                  title: 'Rate us',
                  onPressed: () {},
                ),
                _SettingsTile(
                  id: 4,
                  title: 'Share this app',
                  onPressed: () {},
                ),
                _SettingsTile(
                  id: 5,
                  title: 'Privacy policy',
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const PrivacyPolicyPage();
                      },
                    ));
                  },
                ),
                _SettingsTile(
                  id: 6,
                  title: 'Terms of use',
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const TermsOfUsePage();
                      },
                    ));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  const _SettingsTile({
    required this.id,
    required this.title,
    required this.onPressed,
  });

  final int id;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Button(
      onPressed: onPressed,
      child: Container(
        height: 48,
        margin: const EdgeInsets.only(bottom: 12),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: Color(0xff313344),
            ),
          ),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 40,
              child: SvgWidget('assets/s$id.svg'),
            ),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'w400',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
