import 'package:flutter/material.dart';
import 'package:proyecto/widgets/items_widget.dart';

import '../widgets/home_button_bar.dart';

class FavoritesPage extends StatefulWidget {
  final List<ImageData> imageDataList = [
    ImageData(
      imageName: "imagen1",
      altText: "Investigador Privado",
      author: "Margalit Fox",
      price: 4.56,
      isFavorite: false,
      descripcion:
          "En 1908, una anciana de posición acomodada muere brutalmente asesinada en su domicilio de Glasgow. La policía no tarda en encontrar a un sospechoso muy adecuado: Oscar Slater, un inmigrante alemán de origen judío y más que dudosa reputación.",
    ),
    ImageData(
      imageName: "imagen2",
      altText: "Psicología Oscura",
      author: "Fabián Goleman",
      price: 3.90,
      isFavorite: false,
      descripcion:
          "En 1908, una anciana de posición acomodada muere brutalmente asesinada en su domicilio de Glasgow. La policía no tarda en encontrar a un sospechoso muy adecuado: Oscar Slater, un inmigrante alemán de origen judío y más que dudosa reputación.",
    ),
    ImageData(
      imageName: "imagen3",
      altText: "Manipulación",
      author: "R.J. Anderson",
      price: 3.10,
      isFavorite: false,
      descripcion:
          "En 1908, una anciana de posición acomodada muere brutalmente asesinada en su domicilio de Glasgow. La policía no tarda en encontrar a un sospechoso muy adecuado: Oscar Slater, un inmigrante alemán de origen judío y más que dudosa reputación.",
    ),
    ImageData(
      imageName: "imagen4",
      altText: "Manejo de la ira",
      author: "James W. Williams",
      price: 2.85,
      isFavorite: false,
      descripcion:
          "En 1908, una anciana de posición acomodada muere brutalmente asesinada en su domicilio de Glasgow. La policía no tarda en encontrar a un sospechoso muy adecuado: Oscar Slater, un inmigrante alemán de origen judío y más que dudosa reputación.",
    ),
  ];

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoritos'),
        backgroundColor: Colors.black87,
      ),
      body: ListView.builder(
        itemCount: widget.imageDataList.length,
        itemBuilder: (BuildContext context, int index) {
          ImageData data = widget.imageDataList[index];
          return ListTile(
            title: Text(data.altText),
            leading: Image.asset(
              "assets/${data.imageName}.png",
              width: 50,
            ),
            onTap: () {
              setState(() {
                widget.imageDataList.removeAt(index);
              });
            },
          );
        },
      ),
      bottomNavigationBar: const HomeBottomBar(),
    );
  }
}
