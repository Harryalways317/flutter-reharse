import 'package:baseapp/core/notifiers/cache_notifiers.dart';
import 'package:baseapp/core/notifiers/counter_notifier.dart';
import 'package:baseapp/core/notifiers/mockapi_notifiers.dart';
import 'package:baseapp/meta/views/list_view.dart';
import 'package:baseapp/meta/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _counterNotifier =
        Provider.of<CounterNotifier>(context, listen: false);

    final _cacheNotifier = Provider.of<CacheNotifier>(context, listen: false);

    final _mockAPINotifier =
        Provider.of<MockAPINotifier>(context, listen: false);

    final _Titletextcontroller = TextEditingController();
    final _IDtextcontroller = TextEditingController();
    final _Bodytextcontroller = TextEditingController();
    int a = 0;
    _cacheNotifier.readCache(key: "count").then((value) {
      if (value != null) {
        a = int.parse(value);
      }
    });
    _counterNotifier.setVal(a);
    //IF TRUE THEN REBUID ENTIRE CHANGED WIDGET
    //IF FALSE THEN ONLY REBUILD CONSUMER
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(),
      floatingActionButton: Container(child: Consumer<CounterNotifier>(
        builder: (context, notifier, _) {
          return FloatingActionButton(
            onPressed: () {
              notifier.increment();
              _cacheNotifier.writeCache(
                  key: "counter", value: notifier.count.toString());
            },
            child: Icon(Icons.add),
          );
        },
      )),
      body: Container(child: Consumer<CounterNotifier>(
        builder: (context, notifier, _) {
          return Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(notifier.count.toString()),
              Column(
                children: [
                  TextField(
                    controller: _Titletextcontroller,
                    decoration: InputDecoration(
                      hintText: "Title",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _IDtextcontroller,
                    decoration: InputDecoration(
                      hintText: "ID",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _Bodytextcontroller,
                    decoration: InputDecoration(
                      hintText: "Body",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  ButtonBar(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      MaterialButton(
                        color: Colors.blue,
                        onPressed: () {
                          _mockAPINotifier.getData();
                        },
                        child: Text("Get Data"),
                      ),
                      MaterialButton(
                        color: Colors.yellow,
                        onPressed: () {
                          _mockAPINotifier.getDatabyID("1");
                        },
                        child: Text("Get by ID"),
                      ),
                      MaterialButton(
                        color: Colors.green,
                        onPressed: () {
                          _mockAPINotifier.postData(
                              title: _Titletextcontroller.text,
                              body: _Bodytextcontroller.text,
                              ID: _IDtextcontroller.text);
                        },
                        child: Text("Post"),
                      ),
                      MaterialButton(
                        color: Colors.pink,
                        onPressed: () {
                          _mockAPINotifier.updateData(
                              title: _Titletextcontroller.text,
                              ID: _IDtextcontroller.text);
                        },
                        child: Text("Put"),
                      ),
                    ],
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ListDataView()));
                    },
                    child: Text("Next Screen"),
                    color: Colors.indigo,
                  )
                ],
              ),
              MaterialButton(
                onPressed: () {
                  _cacheNotifier.deleteCache(key: 'login');
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginView()));
                },
                color: Colors.blue,
                child: Text("Logout"),
              ),
            ],
          ));
        },
      )),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
