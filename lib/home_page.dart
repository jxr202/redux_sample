import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_sample/counter_page.dart';
import 'package:redux_sample/redux/app.dart';

/// 首页
class HomePage extends StatefulWidget {
  final String title;

  const HomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: StoreConnector<AppState, int>(
          converter: (store) => store.state.count,
          builder: (context, count) {
            return Text(
              'Home Page Count Result: $count',
              style: Theme.of(context).textTheme.headlineSmall,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
            return const CounterPage();
          }));
        },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
