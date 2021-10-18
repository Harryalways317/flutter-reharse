import 'package:baseapp/core/notifiers/cache_notifiers.dart';
import 'package:baseapp/core/notifiers/counter_notifier.dart';
import 'package:baseapp/core/notifiers/mockapi_notifiers.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (_) => CounterNotifier()),
  ChangeNotifierProvider(create: (_) => CacheNotifier()),
  ChangeNotifierProvider(create: (_) => MockAPINotifier()),
];
