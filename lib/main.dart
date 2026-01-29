import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/watch_list_page.dart';
import 'pages/coming_soon_page.dart';
import 'pages/discovery_page.dart';
import 'pages/friends_page.dart';
import 'pages/parties_page.dart';
import 'pages/media_page.dart';
import 'pages/settings_page.dart';
import 'widgets/sidebar.dart';

void main() {
  runApp(const MyApp());
}

enum NavPage {
  home,
  watchList,
  comingSoon,
  discovery,
  friends,
  parties,
  media,
  settings,
  logout,
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YuHoo',
      theme: ThemeData(primarySwatch: Colors.red, useMaterial3: true),
      home: const MyHomePage(title: 'YuHoo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  NavPage _currentPage = NavPage.home;

  void _navigateTo(NavPage page) {
    setState(() {
      _currentPage = page;
    });
    Navigator.pop(context); // Close drawer after navigation
  }

  Widget _buildPage() {
    switch (_currentPage) {
      case NavPage.home:
        return const HomePage();
      case NavPage.watchList:
        return const WatchListPage();
      case NavPage.comingSoon:
        return const ComingSoonPage();
      case NavPage.discovery:
        return const DiscoveryPage();
      case NavPage.friends:
        return const FriendsPage();
      case NavPage.parties:
        return const PartiesPage();
      case NavPage.media:
        return const MediaPage();
      case NavPage.settings:
        return const SettingsPage();
      case NavPage.logout:
        return const HomePage(); // Placeholder
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: false,
        actions: [
          Expanded(
            child: Center(
              child: SizedBox(
                height: 40,
                width: 300,
                child: SearchBar(
                  hintText: 'Search here...',
                  leading: const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Icon(Icons.search),
                  ),
                ),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.account_circle, size: 32),
            onPressed: () {
              // Handle account icon tap
            },
          ),
        ],
      ),
      drawer: Sidebar(onNavigate: _navigateTo, currentPage: _currentPage),
      body: _buildPage(),
    );
  }
}
