abstract class Cache {
  /// Saves an item
  /// Returns [true] if the item was saved
  Future<bool> put<T>(String key, T item);

  /// Gets an item by its key
  /// Returns [null] if it doesn't exist
  Future<T?> get<T>(String key);

  /// Returns if an item is available in the cache by giving its [key]
  Future<bool> containsKey(String key);

  /// Removes an item by its key
  /// Returns [true] if the item existed and is now removed
  Future<bool> remove(String key);

  /// Removes all items
  Future<void> clear();
}
