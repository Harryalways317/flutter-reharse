import 'package:baseapp/core/providers/cache_notifiers.dart';
import 'package:baseapp/core/providers/counter_notifier.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (_) => CounterNotifier()),
  ChangeNotifierProvider(create: (_) => CacheNotifier()),
];
