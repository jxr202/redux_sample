import 'package:flutter/material.dart';

/// State 中所有属性都是只读的，不能直接修改
@immutable
class AppState {
  final int _count;

  get count => _count;

  const AppState(this._count);

  const AppState.initialState() : _count = 0;

  AppState copyWith(count) {
    return AppState(count ?? _count);
  }
}
