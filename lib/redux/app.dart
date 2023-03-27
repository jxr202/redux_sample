export 'app_action.dart';
export 'app_reducer.dart';
export 'app_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_sample/redux/app.dart';

class Dispatcher {
  Dispatcher._();

  /// 获取 Store
  static Store<AppState> store(BuildContext context) => StoreProvider.of<AppState>(context);

  /// 获取当前的 State
  static AppState state(BuildContext context) => store(context).state;
}
