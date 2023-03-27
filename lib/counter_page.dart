import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_sample/redux/app.dart';

/// 计算页
class CounterPage extends StatefulWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter Page')),
      backgroundColor: Colors.deepPurpleAccent[100],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Counter Page Count Result:',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            StoreConnector<AppState, int>(
              converter: (store) => store.state.count,
              builder: (context, count) {
                return Text(
                  '$count',
                  style: Theme.of(context).textTheme.displayLarge,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "dec",
            onPressed: () => Dispatcher.store(context).dispatch(AppAction.dec),
            child: const Icon(Icons.exposure_minus_1),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: "add",
            onPressed: () => Dispatcher.store(context).dispatch(AppAction.add),
            child: const Icon(Icons.exposure_plus_1),
          )
        ],
      ),
    );
  }
}
