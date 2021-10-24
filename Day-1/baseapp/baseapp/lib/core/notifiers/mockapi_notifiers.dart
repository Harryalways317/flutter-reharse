import 'dart:convert';

import 'package:baseapp/core/api/mockapi.dart';
import 'package:flutter/material.dart';

class MockAPINotifier extends ChangeNotifier {
  final mockAPI = new MockAPI();
  List _posts = [];
  List get posts => _posts;

  Future getData() async {
    try {
      mockAPI.getData().then((value) async {
        final parsedData = await jsonDecode(value.toString());
        _posts = parsedData;
        notifyListeners();
      });
    } catch (error) {
      print(error);
    }
  }

  Future getDatabyID(String ID) async {
    try {
      mockAPI.getDatabyID(ID);
    } catch (error) {
      print(error);
    }
  }

  Future postData(
      {required String title, required String body, required String ID}) async {
    try {
      mockAPI.postData(title: title, body: body, ID: ID);
    } catch (error) {
      print(error);
    }
  }

  Future updateData({required String title, required String ID}) async {
    try {
      mockAPI.updateData(title: title, ID: ID);
    } catch (error) {
      print(error);
    }
  }
}
