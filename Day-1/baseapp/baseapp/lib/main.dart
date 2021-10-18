import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/providers/providers.dart';

import 'meta/views/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        home: SplashView(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
