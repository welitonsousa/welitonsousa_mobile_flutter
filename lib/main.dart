import 'package:flutter/material.dart';
import 'package:welitonsousa_mobile/env.dart';
import 'package:welitonsousa_mobile/pages/page_layout.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: env.title,
      debugShowCheckedModeBanner: env.showBanner,
      initialRoute: 'layout',
      routes: {
        'layout': (context) => PageLayout(),
      },
    );
  }
}
