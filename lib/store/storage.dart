import 'package:memory_cache/memory_cache.dart';

updateThemeIndex(key, value) {
  int? val = MemoryCache.instance.read<int>(key);
  if (val != null) {
    MemoryCache.instance.update<int>(key, value);
  } else {
    MemoryCache.instance.create<int>(key, value);
  }
}

deleteThmenIndex(key) {
  MemoryCache.instance.delete(key);
}

getThemeIndex(key) {
  // 获取过程
  int? themeIndex;
  themeIndex = MemoryCache.instance.read<int>(key);
  return themeIndex ?? 0;
}
