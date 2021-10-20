import 'package:flutter/material.dart';

class CounterNotifier extends ChangeNotifier {
  int _count = 0;
  int get count => _count;
  setVal(val) {
    _count = val;
  }

  increment() {
    _count++;
    notifyListeners();
  }
}
