import 'package:flutter/material.dart';
import '../main.dart';

class Sidebar extends StatelessWidget {
  final Function(NavPage) onNavigate;
  final NavPage currentPage;

  const Sidebar({
    super.key,
    required this.onNavigate,
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _buildSectionTitle('MENU'),
          _buildMenuItem(Icons.home, 'Home', NavPage.home),
          _buildMenuItem(Icons.bookmark, 'Watch List', NavPage.watchList),
          _buildMenuItem(Icons.access_time, 'Coming Soon', NavPage.comingSoon),
          _buildMenuItem(Icons.explore, 'Discovery', NavPage.discovery),
          const Divider(),
          _buildSectionTitle('SOCIAL'),
          _buildMenuItem(Icons.people, 'Friends', NavPage.friends),
          _buildMenuItem(Icons.celebration, 'Parties', NavPage.parties),
          _buildMenuItem(Icons.perm_media, 'Media', NavPage.media),
          const Divider(),
          _buildSectionTitle('GENERAL'),
          _buildMenuItem(Icons.settings, 'Settings', NavPage.settings),
          _buildMenuItem(Icons.logout, 'Log Out', NavPage.logout),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String label, NavPage page) {
    final isSelected = currentPage == page;
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      selected: isSelected,
      selectedTileColor: Color.fromARGB(75, 0, 0, 0),
      onTap: () {
        onNavigate(page);
      },
    );
  }
}
