import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'services/favorites_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FavoritesService.init();
  runApp(const PetsumuApp());
}

class PetsumuApp extends StatelessWidget {
  const PetsumuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PETSUMU',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFF6B9D),
          secondary: const Color(0xFF4ECDC4),
          surface: Colors.white,
        ),
        fontFamily: 'NotoSansJP',
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: Color(0xFF333333),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}