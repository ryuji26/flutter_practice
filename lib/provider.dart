import 'dart:ffi';

import 'package:flutter_practice/Data/count_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final titleProvider = Provider<String>((ref) {
  return 'Riverpod Demo Home Page1';
});

final messageProvider = Provider<String>((ref) {
  return '1You have pushed the button this many times:';
});

final countProvider = StateProvider<int>((ref) => 0);
final countDataProvider = StateProvider<CountData>((ref) {
  return CountData(count: 0, countUp: 0, countDown: 0);
});
