import 'package:flutter/material.dart';
import 'package:flutter_application_18/pages/home_page.dart';
import 'package:flutter_application_18/ui_helpers/ui_color_helper.dart';
//import 'package:flutter_application_18/provider_sayac.dart';
//import 'package:flutter_application_18/stream_sayac.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ByteCoin',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: UiColorHelper.mainLightBg,
        /* light theme settings */
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: UiColorHelper.mainDarkBg
        /* dark theme settings */
      ),
      themeMode: ThemeMode.system,
      home: const ByteCoin(),
    );
  }
}
