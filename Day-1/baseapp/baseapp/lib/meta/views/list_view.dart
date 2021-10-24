import 'package:baseapp/core/notifiers/mockapi_notifiers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListDataView extends StatefulWidget {
  const ListDataView({Key? key}) : super(key: key);

  @override
  _ListDataViewState createState() => _ListDataViewState();
}

class _ListDataViewState extends State<ListDataView> {
  @override
  void initState() {
    Provider.of<MockAPINotifier>(context, listen: false).getData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _mockAPINotifier =
        Provider.of<MockAPINotifier>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("ListData"),
      ),
      body: Container(
        child: FutureBuilder(
            future: _mockAPINotifier.getData(),
            builder: (context, snapshot) {
              while (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.builder(
                  itemCount: _mockAPINotifier.posts.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        child: Text(
                            _mockAPINotifier.posts[index]['id'].toString()),
                      ),
                      title: Text(
                          _mockAPINotifier.posts[index]['title'].toString()),
                      subtitle: Text(
                          _mockAPINotifier.posts[index]['body'].toString()),
                    );
                  });
            }),
      ),
    );
  }
}
