import 'package:flutter/material.dart';
import 'package:proyecto/views/register_user.dart';
import 'package:proyecto/widgets/home_button_bar.dart';
import 'package:proyecto/widgets/items_widget.dart';

class BooksPage extends StatefulWidget {
  const BooksPage({Key? key}) : super(key: key);

  @override
  State<BooksPage> createState() => _BooksPage();
}

class _BooksPage extends State<BooksPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
    _tabController.addListener(_handleTabSelection);
    super.initState();
  }

  _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Ubicación",
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "Quito, Ecuador",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegisterUser()),
                          );
                        },
                        child: Icon(
                          Icons.account_circle,
                          color: Colors.white.withOpacity(0.5),
                          size: 35,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Buscar Libro",
                        hintStyle: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                        ),
                        prefixIcon: Icon(Icons.search,
                            size: 30, color: Colors.white.withOpacity(0.5)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 3),
                ],
              ),
            ),
            const SizedBox(height: 5),
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  margin: const EdgeInsets.only(top: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Image.asset(
                    'assets/fondo.png',
                    fit: BoxFit.cover,
                    width: 200,
                    height: 150,
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                      ),
                    ),
                    child: const Text(
                      'Novedades',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            TabBar(
              controller: _tabController,
              labelColor: const Color(0xFFC67C4E),
              unselectedLabelColor: Colors.black.withOpacity(0.5),
              isScrollable: true,
              indicator: const UnderlineTabIndicator(
                borderSide: BorderSide(width: 3, color: Color(0xFFC67C4E)),
                insets: EdgeInsets.symmetric(horizontal: 16),
              ),
              labelStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
              labelPadding: const EdgeInsets.symmetric(horizontal: 20),
              tabs: const [
                Tab(text: "Comedia"),
                Tab(text: "Ficción"),
                Tab(text: "Romance"),
                Tab(text: "Terror"),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  Center(
                    child: [
                      ItemsWidget(),
                      ItemsWidget(),
                      ItemsWidget(),
                      ItemsWidget(),
                    ][_tabController.index],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const HomeBottomBar(),
    );
  }
}
