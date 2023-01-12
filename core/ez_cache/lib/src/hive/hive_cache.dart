// Dart imports:
import 'dart:async';

// Package imports:
import 'package:hive_flutter/hive_flutter.dart';

import '../cache.dart';
import '../key/keys.dart';

class HiveCache implements Cache {
  static final HiveCache instance = HiveCache._internal();

  factory HiveCache() {
    return instance;
  }

  HiveCache._internal();

  late Box<dynamic> _box;

  Future<void> initialize({
    required Function() registerAdapters,
  }) async {
    await Hive.initFlutter();
    registerAdapters.call();
    await Hive.openBox<dynamic>(Keys.hiveBoxName);

    _box = Hive.box<dynamic>(Keys.hiveBoxName);
  }

  @override
  Future<void> clear() {
    return _box.clear();
  }

  @override
  Future<bool> containsKey(String key) {
    return Future.value(_box.containsKey(key));
  }

  @override
  Future<T?> get<T>(String key) async {
    final result = await _box.get(key);
    return result;
  }

  @override
  Future<bool> put<T>(String key, T item) async {
    await _box.put(key, item);
    final result = (await _box.get(key)) as T;
    return result == item;
  }

  @override
  Future<bool> remove(String key) async {
    if (_box.containsKey(key)) {
      await _box.delete(key);
      if (!_box.containsKey(key)) {
        return true;
      }
    }
    return false;
  }
}
