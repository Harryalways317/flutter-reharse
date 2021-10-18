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
}
