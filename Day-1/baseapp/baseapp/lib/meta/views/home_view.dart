import 'package:baseapp/core/notifiers/cache_notifiers.dart';
import 'package:baseapp/core/notifiers/counter_notifier.dart';
import 'package:baseapp/core/notifiers/mockapi_notifiers.dart';
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
            },
            child: Icon(Icons.add),
          );
        },
      )),
      body: Container(child: Consumer<CounterNotifier>(
        builder: (context, notifier, _) {
          return Center(
              child: Column(
            children: [
              Text(notifier.count.toString()),
              TextButton(
                onPressed: () {
                  _mockAPINotifier.getData();
                },
                child: Text("Get Data"),
              ),
              TextButton(
                onPressed: () {
                  _cacheNotifier.deleteCache(key: 'login');
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginView()));
                },
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
