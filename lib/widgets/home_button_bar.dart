import 'package:flutter/material.dart';
import 'package:proyecto/views/home_page.dart';
import '../views/books_page.dart';
import '../views/favorites_page.dart';

class HomeBottomBar extends StatefulWidget {
  const HomeBottomBar({Key? key}) : super(key: key);

  @override
  _HomeBottomBarState createState() => _HomeBottomBarState();
}

class _HomeBottomBarState extends State<HomeBottomBar> {
  int _selectedIndex = 0;
  List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    _pages = [
      const BooksPage(),
      FavoritesPage(),
      Container(), // Página de notificaciones (aún por definir)
      const HomePage(),
    ];
  }

  void _onIconPressed(BuildContext context, int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Si la página ya está abierta, regresa a ella
    if (ModalRoute.of(context)!.settings.name == _pages[index].toString()) {
      Navigator.popUntil(context, ModalRoute.withName('/'));
    } else {
      // Si la página no está abierta, abre una nueva instancia
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => _pages[index]),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 8,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildIcon(Icons.home, 0, context),
          _buildIcon(Icons.favorite_outlined, 1, context),
          _buildIcon(Icons.notifications, 2, context),
          _buildIcon(Icons.exit_to_app, 3, context),
        ],
      ),
    );
  }

  Widget _buildIcon(IconData icon, int index, BuildContext context) {
    return GestureDetector(
      onTap: () {
        _onIconPressed(context, index); // Pasar el contexto como argumento
      },
      child: Icon(
        icon,
        color: _selectedIndex == index ? Color(0xFFC67C4E) : Colors.black,
        size: 35,
      ),
    );
  }
}
