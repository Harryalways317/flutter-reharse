import 'package:brightness_slider/home_view.dart';
import 'package:brightness_slider/notifiers.dart';
import 'package:brightness_slider/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(CoreApp());
}

class CoreApp extends StatelessWidget {
  const CoreApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: providers, child: MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeNotifier.isDark ? ThemeData.dark() : ThemeData.light(),
      home: HomeView(),
    );
  }
}
