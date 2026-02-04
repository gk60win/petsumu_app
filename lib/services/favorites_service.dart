import 'package:shared_preferences/shared_preferences.dart';

class FavoritesService {
  static late SharedPreferences _prefs;
  static const _key = 'favorite_property_ids';

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static List<String> getFavoriteIds() {
    return _prefs.getStringList(_key) ?? [];
  }

  static Future<void> toggleFavorite(String id) async {
    final ids = getFavoriteIds();
    if (ids.contains(id)) {
      ids.remove(id);
    } else {
      ids.add(id);
    }
    await _prefs.setStringList(_key, ids);
  }

  static Future<bool> isFavorite(String id) async {
    final ids = getFavoriteIds();
    return ids.contains(id);
  }
}