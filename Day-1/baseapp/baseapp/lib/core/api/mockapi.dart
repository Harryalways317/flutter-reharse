import 'dart:convert';

import 'package:baseapp/app/routes/api_routes.dart';
import 'package:http/http.dart' as http;

class MockAPI {
  final client = http.Client();

  //GET METHOD
  Future getData() async {
    print("Fetching Data");
    final subUrl = "/posts";
    final Uri uri = Uri.parse(BASEURL + subUrl);
    final http.Response response = await client.get(uri, headers: {
      'Contetnt-type': 'application/json',
      'Accecpt': 'application/json'
    });
    if (response.statusCode == 200) {
      print(response.body);
    }
  }

  Future getDatabyID(String ID) async {
    print("Fetching Data");
    final subUrl = "/posts/$ID";
    final Uri uri = Uri.parse(BASEURL + subUrl);
    final http.Response response = await client.get(uri, headers: {
      'Contetnt-type': 'application/json',
      'Accecpt': 'application/json'
    });
    if (response.statusCode == 200) {
      print(response.body);
    }
  }

  Future postData(
      {required String title, required String body, required String ID}) async {
    print("Posting Data");
    final subUrl = "/posts";
    final Uri uri = Uri.parse(BASEURL + subUrl);
    print(uri);
    final http.Response response = await client.post(uri,
        body: jsonEncode({'title': title, 'body': body, 'id': ID}),
        headers: {
          'Contetnt-type': 'application/json',
          'Accecpt': 'application/json'
        });
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.body);
    }
  }

  Future updateData({required String title, required String ID}) async {
    print("Replacing  Data");
    final subUrl = "/posts/$ID";
    final Uri uri = Uri.parse(BASEURL + subUrl);
    print(uri);
    print(title);
    final http.Response response = await client.patch(uri,
        body: jsonEncode({
          'title': title,
        }),
        headers: {
          'Contetnt-type': 'application/json',
          'Accecpt': 'application/json'
        });
    print(response.statusCode);
    print(response.body);
  }
}
