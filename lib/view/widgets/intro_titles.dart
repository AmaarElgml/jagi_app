import 'package:flutter/material.dart';
import 'package:jagi_app/styles/app_theme.dart';

class IntroTitles extends StatelessWidget {
  IntroTitles({required this.isLogin});

  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(height: height * .08),
      Text(isLogin ? 'Hello Again!' : 'Hello!', style: titlesStyle),
      SizedBox(height: 6),
      Text(isLogin ? 'Welcome' : 'Signup to', style: titlesStyle),
      SizedBox(height: 6),
      Text(isLogin ? 'back' : 'Get started', style: titlesStyle)
    ]);
  }
}
