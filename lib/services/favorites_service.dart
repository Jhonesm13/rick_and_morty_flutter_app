import 'package:shared_preferences/shared_preferences.dart';

class FavoritesService {
  static const _key = 'favorite_characters';

  static Future<List<int>> getFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_key)?.map(int.parse).toList() ?? [];
  }

  static Future<void> toggleFavorite(int id) async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = prefs.getStringList(_key) ?? [];

    if (favorites.contains(id.toString())) {
      favorites.remove(id.toString());
    } else {
      favorites.add(id.toString());
    }

    await prefs.setStringList(_key, favorites);
  }

  static Future<bool> isFavorite(int id) async {
    final favorites = await getFavorites();
    return favorites.contains(id);
  }
}
