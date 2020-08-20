import 'package:local_cache_sync/local_cache_sync.dart';

setThemeIndex(key, value) async {
  LocalCacheSync.userDefault.setWithKey<int>(key, value);
}

getThemeIndex(key) {
  // 获取过程
  int themeIndex;
  themeIndex = LocalCacheSync.userDefault.getWithKey<int>(key);
  return null == themeIndex ? 0 : themeIndex;
}
