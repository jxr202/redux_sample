import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_sample/redux/app_action.dart';
import 'package:redux_sample/redux/app_state.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CounterPage'),
      ),
      backgroundColor: Colors.deepPurpleAccent[100],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You have pushed the button this many times:'),
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
            onPressed: () => StoreProvider.of<AppState>(context).dispatch(AppAction.dec),
            child: const Icon(Icons.exposure_minus_1),
          ),
          const SizedBox(height: 5),
          FloatingActionButton(
            heroTag: "add",
            onPressed: () => StoreProvider.of<AppState>(context).dispatch(AppAction.add),
            child: const Icon(Icons.exposure_plus_1),
          )
        ],
      ),


      // floatingActionButton: StoreConnector<AppState, void Function(AppAction)>(
      //   converter: (store) => (action) => store.dispatch(action),
      //   builder: (context, callback) => Column(
      //     mainAxisAlignment: MainAxisAlignment.end,
      //     children: [
      //       FloatingActionButton(
      //         onPressed: () => callback(AppAction.dec),
      //         child: const Icon(Icons.exposure_minus_1),
      //       ),
      //       const SizedBox(height: 5),
      //       FloatingActionButton(
      //         onPressed: () => callback(AppAction.add),
      //         child: const Icon(Icons.exposure_plus_1),
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}
