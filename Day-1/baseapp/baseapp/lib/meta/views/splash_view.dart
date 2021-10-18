import 'dart:async';

import 'package:baseapp/core/providers/cache_notifiers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_view.dart';
import 'login_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    var _cacheNotifier = Provider.of<CacheNotifier>(context, listen: false);
    _cacheNotifier.readCache(key: "login").then((value) {
      if (value != null) {
        return Timer(
            Duration(seconds: 1),
            () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => HomeView())));
      } else {
        return Timer(
            Duration(seconds: 1),
            () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => LoginView())));
      }
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Icon(Icons.card_giftcard),
      ),
    );
  }
}
