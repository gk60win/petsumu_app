import 'package:flutter/material.dart';
import '../services/fudo_api.dart';
import '../models/fudo.dart';
import 'fudo_detail_screen.dart';  // ← 必ず追加する！

class FudoListScreen extends StatefulWidget {
  @override
  State<FudoListScreen> createState() => _FudoListScreenState();
}

class _FudoListScreenState extends State<FudoListScreen> {
  late Future<List<Fudo>> futureList;

  @override
  void initState() {
    super.initState();
    futureList = FudoApi.fetchFudos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("物件一覧")),
      body: FutureBuilder<List<Fudo>>(
        future: futureList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text("エラー: ${snapshot.error}"));
          }

          final fudos = snapshot.data!;

          return ListView.builder(
            itemCount: fudos.length,
            itemBuilder: (context, index) {
              final fudo = fudos[index];

              return ListTile(
                title: Text(fudo.title),
                subtitle: Text("ID: ${fudo.id}"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => FudoDetailScreen(fudo: fudo),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
