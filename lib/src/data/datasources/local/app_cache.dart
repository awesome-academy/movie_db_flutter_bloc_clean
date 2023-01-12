import 'package:ez_cache/ez_cache.dart';

class AppCache {
  factory AppCache() => instance;

  AppCache._internal();
  static final AppCache instance = AppCache._internal();

  late HiveCache _hiveCache;

  Future<void> init(HiveCache cache) async {
    _hiveCache = cache;

    await _hiveCache.initialize(
      registerAdapters: () {},
    );
  }
}
