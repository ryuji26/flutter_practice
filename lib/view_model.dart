import 'package:flutter/material.dart';
import 'package:flutter_practice/logic.dart';
import 'package:flutter_practice/provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ViewModel {
  Logic _logic = Logic();
  late WidgetRef _ref;

  void setRef(WidgetRef ref) {
    this._ref = ref;
  }

  get count => _ref.watch(countDataProvider).count.toString();
  get countDown => _ref.watch(countDataProvider).countDown.toString();
  get countUp => _ref.watch(countDataProvider).countUp.toString();

  void onIncrease() {
    _logic.increase();

    _ref.watch(countDataProvider.state).state = _logic.countData;
  }

  void onDecrease() {
    _logic.decrease();

    _ref.watch(countDataProvider.state).state = _logic.countData;
  }

  void onReset() {
    _logic.reset();

    _ref.watch(countDataProvider.state).state = _logic.countData;
  }
}
