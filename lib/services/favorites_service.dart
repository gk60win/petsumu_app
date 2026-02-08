import 'package:shared_preferences/shared_preferences.dart';

class FavoritesService {
  static const _favoritesKey = 'favorites';
  static late SharedPreferences _prefs;

  /// main() で一度だけ呼ぶ
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  /// 保存されているお気に入り ID 一覧（int）を取得
  static List<int> getFavoriteIds() {
    final stored = _prefs.getStringList(_favoritesKey) ?? [];
    return stored
        .map((e) => int.tryParse(e))
        .where((e) => e != null)
        .map((e) => e!)
        .toList();
  }

  /// 単一IDがお気に入りかどうか
  static Future<bool> isFavorite(int id) async {
    final ids = getFavoriteIds();
    return ids.contains(id);
  }

  /// お気に入りのオン/オフを切り替え
  static Future<void> toggleFavorite(int id) async {
    final stored = _prefs.getStringList(_favoritesKey) ?? [];
    final idStr = id.toString();

    if (stored.contains(idStr)) {
      stored.remove(idStr);
    } else {
      stored.add(idStr);
    }

    await _prefs.setStringList(_favoritesKey, stored);
  }
}
