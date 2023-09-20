import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final translate = AppLocalizations.of(context);
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF00D0CE),
              Color(0xFF82E5BA),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Image.asset(
                  'assets/images/img.png',
                  width: 120,
                  height: 120,
                ),
                const SizedBox(height: 10),
                Text(
                  '${translate?.currencyConverter}',
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                const SizedBox(height: 10),
                drawerElement(
                  FlutterRemix.google_play_line,
                  '${translate?.rateOnPlayMarket}',
                  () {
                    launchUrl(
                      Uri.parse(
                          'https://play.google.com/store/apps/details?id=com.smartwho.SmartAllCurrencyConverter'),
                    );
                  },
                ),
                drawerElement(
                  FlutterRemix.github_line,
                  '${translate?.programcode}',
                  () {
                    launchUrl(
                      Uri.parse(
                          'https://github.com/AbdurazzoqAbdugafforov/currency_converter'),
                    );
                  },
                ),
                drawerElement(
                  FlutterRemix.telegram_line,
                  '${translate?.telegramChannel}',
                  () {
                    launchUrl(
                      Uri.parse('https://t.me/Abu_3220'),
                    );
                  },
                ),
                drawerElement(
                  FlutterRemix.facebook_box_line,
                  '${translate?.facebookChannel}',
                  () {
                    launchUrl(
                      Uri.parse(
                          'https://www.facebook.com/profile.php?id=10008291042483'),
                    );
                  },
                ),
                drawerElement(
                  FlutterRemix.twitter_line,
                  '${translate?.twitterChannel}',
                  () {
                    launchUrl(
                      Uri.parse('https://twitter.com/AbuPobgm62545'),
                    );
                  },
                ),
                drawerElement(
                  FlutterRemix.instagram_line,
                  '${translate?.instagramChannel}',
                  () {
                    launchUrl(
                      Uri.parse('https://www.instagram.com/abdurazzoq1232/'),
                    );
                  },
                ),
                drawerElement(
                  FlutterRemix.chat_1_line,
                  '${translate?.option}',
                  () {
                    launchUrl(
                      Uri.parse('https://t.me/Abu_3220'),
                    );
                  },
                ),
                drawerElement(
                  FlutterRemix.information_line,
                  '${translate?.aboutTheProgram}',
                  () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xFF00D0CE),
                                  Color(0xFF82E5BA),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '${translate?.currencyConverter}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20),
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  'v1.0.0',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    text: '${translate?.wordurl}',
                                    style: const TextStyle(
                                      color: Color(0xFF007c70),
                                      fontSize: 16,
                                      decoration: TextDecoration.underline,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        launchUrl(
                                            Uri.parse('https://cbu.uz/uz/'));
                                      },
                                    children: [
                                      TextSpan(
                                        text: '${translate?.word}',
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            decoration: TextDecoration.none),
                                      ),
                                      TextSpan(
                                        text: 'Apache License',
                                        style: const TextStyle(
                                          color: Color(0xFF007c70),
                                          fontSize: 16,
                                          decoration: TextDecoration.underline,
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            launchUrl(Uri.parse(
                                                'https://www.apache.org/'));
                                          },
                                      ),
                                      TextSpan(
                                        text: ' ${translate?.word2}',
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            decoration: TextDecoration.none),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                const Text(
                                  '© Abdurazzoq',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    backgroundColor: const Color(0xFF81D6C3),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    'OK',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 18),
              child: Text(
                '©Abdurazzoq',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget drawerElement(IconData iconData, String title, Function() onPressed) {
    return ListTile(
      onTap: onPressed,
      leading: Icon(iconData, color: Colors.black),
      title: Text(
        title,
        style: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black),
      ),
    );
  }
}
