import 'package:redux_sample/redux/app_action.dart';
import 'package:redux_sample/redux/app_state.dart';

/// Reducer 是一个纯函数，根据 State 和 Action 得到新的 State
AppState counterReducer(AppState state, action) {
  switch (action) {
    case AppAction.add:
      return AppState(state.count + 1);
    case AppAction.dec:
      return AppState(state.count - 1);
    default:
      return state;
  }
}
