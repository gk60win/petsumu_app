import 'package:flutter/material.dart';
import 'search_screen.dart';
import 'favorites_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = [
    SearchScreen(),
    FavoritesScreen(),
    Center(child: Text('マイページ（未実装）')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: _onItemTapped,
        selectedIndex: _selectedIndex,
        destinations: const [
          NavigationDestination(
            selectedIcon: Icon(Icons.search, color: Color(0xFFFF6B9D)),
            icon: Icon(Icons.search_outlined),
            label: 'さがす',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.favorite, color: Color(0xFFFF6B9D)),
            icon: Icon(Icons.favorite_border),
            label: 'お気に入り',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.person, color: Color(0xFFFF6B9D)),
            icon: Icon(Icons.person_outline),
            label: 'マイページ',
          ),
        ],
      ),
    );
  }
}