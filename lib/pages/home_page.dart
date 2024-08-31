import 'package:combi/utils/actus.dart';
import 'package:combi/utils/shop_item.dart';
import 'package:combi/widget/chat_widget.dart';
import 'package:combi/widget/dashboard_widget.dart';
import 'package:combi/widget/home_widget.dart';
import 'package:combi/widget/setting_widget.dart';
import 'package:combi/widget/shop_widget.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final int initialIndex; // Ajouter un paramètre initialIndex

  const HomePage({Key? key, this.initialIndex = 0}) : super(key: key); // initialIndex par défaut à 0

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex; // Initialiser _currentIndex avec l'argument passé
  }

  Widget renderWidget(int index) {
    switch (index) {
      case 0:
        return homeWidget();
      case 1:
        return dashboardWidget();
      case 2:
        return shopWidget();
      case 3:
        return chatWidget();
      case 4:
        return settingsWidget();
      default:
        return homeWidget();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      body: renderWidget(_currentIndex),
      bottomNavigationBar: CurvedNavigationBar(
        index: _currentIndex,
        backgroundColor: Theme.of(context).colorScheme.background,
        animationDuration: const Duration(milliseconds: 300),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          Icon(Icons.home),
          Icon(Icons.dashboard),
          Icon(Icons.shopping_basket),
          Icon(Icons.chat),
          Icon(Icons.settings),
        ],
      ),
    );
  }
}
