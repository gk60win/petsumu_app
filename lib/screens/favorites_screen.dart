import 'package:flutter/material.dart';
import '../models/fudo.dart';
import '../services/favorites_service.dart';
import '../services/fudo_api.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  late Future<List<Fudo>> _favoritesFuture;

  @override
  void initState() {
    super.initState();
    _reloadFavorites();
  }

  void _reloadFavorites() {
    setState(() {
      _favoritesFuture = _loadFavorites();
    });
  }

  Future<List<Fudo>> _loadFavorites() async {
    // ① 保存されているお気に入りID一覧を取得
    final favoriteIds = FavoritesService.getFavoriteIds();
    if (favoriteIds.isEmpty) {
      return [];
    }

    // ② APIから全物件を取得（件数が多くなったらページング検討）
    final allFudos = await FudoApi.fetchFudos();

    // ③ ID が一致するものだけ絞り込み
    return allFudos.where((f) => favoriteIds.contains(f.id)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('お気に入り'),
      ),
      body: FutureBuilder<List<Fudo>>(
        future: _favoritesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Text('エラーが発生しました: ${snapshot.error}'),
            );
          }

          final fudos = snapshot.data ?? [];

          if (fudos.isEmpty) {
            return const Center(
              child: Text('お気に入りに登録された物件はまだありません'),
            );
          }

          return ListView.builder(
            itemCount: fudos.length,
            itemBuilder: (context, index) {
              final f = fudos[index];

              return ListTile(
                title: Text(
                  f.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text('ID: ${f.id}'),
                trailing: IconButton(
                  icon: const Icon(Icons.favorite, color: Colors.pink),
                  onPressed: () async {
                    await FavoritesService.toggleFavorite(f.id);
                    _reloadFavorites();
                  },
                ),
                onTap: () {
                  // TODO: ここで詳細画面へ遷移など
                  // Navigator.push(...);
                },
              );
            },
          );
        },
      ),
    );
  }
}
