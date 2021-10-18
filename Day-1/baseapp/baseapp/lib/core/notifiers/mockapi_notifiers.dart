import 'package:baseapp/core/api/mockapi.dart';
import 'package:flutter/material.dart';

class MockAPINotifier extends ChangeNotifier {
  final mockAPI = new MockAPI();

  Future getData() async {
    try {
      mockAPI.getData();
    } catch (error) {
      print(error);
    }
  }
}
