import 'package:flutter/material.dart';
import 'package:wallet_app/ui/screens/home_screen.dart';
import 'ui/component/appBar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Wallet App',
      debugShowCheckedModeBanner: false,
      home: MainApp(),
    );
  }
}

enum TabItem { home, explorar, notification, setting }

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  TabItem _curentItem = TabItem.home;
  final List<TabItem> _bottomTabs = [
    TabItem.home,
    TabItem.explorar,
    TabItem.notification,
    TabItem.setting
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: SafeArea(
            child: appBar(
          const Icon(
            Icons.notes,
            color: Colors.black54,
          ),
          'Wallets',
          const Icon(
            Icons.account_balance_wallet,
            color: Colors.black54,
          ),
        )),
      ),
      body: _buildScreen(),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      items: _bottomTabs
          .map((tabItem) => _bottomNavigationBarItem(_icon(tabItem), tabItem))
          .toList(),
      onTap: _onSelectTab,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
    );
  }

  void _onSelectTab(int index) {
    TabItem _selectedTabItem = _bottomTabs[index];
    setState(() {
      _curentItem = _selectedTabItem;
    });
  }

  BottomNavigationBarItem _bottomNavigationBarItem(
      IconData icon, TabItem tabItem) {
    final Color color =
        _curentItem == tabItem ? Colors.black54 : Colors.black26;
    return BottomNavigationBarItem(
        icon: Icon(
          icon,
          color: color,
        ),
        label: '');
  }

  IconData _icon(TabItem item) {
    switch (item) {
      case TabItem.home:
        return Icons.account_balance_wallet;
      case TabItem.notification:
        return Icons.notifications;
      case TabItem.explorar:
        return Icons.explore;
      case TabItem.setting:
        return Icons.settings;
    }
  }

  Widget _buildScreen() {
    switch (_curentItem) {
      case TabItem.home:
        return HomeScreen();
      case TabItem.notification:
        return Container(
          child: Center(
            child: Text('notification'),
          ),
        );
      case TabItem.explorar:
        return Container(
          child: Center(
            child: Text('explorar'),
          ),
        );
      case TabItem.setting:
        return Container(
          child: Center(
            child: Text('setting'),
          ),
        );
    }
  }
}
