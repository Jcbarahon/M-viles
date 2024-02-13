import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyecto/views/single_book.dart';

class ImageData {
  final String imageName;
  final String altText;
  final String author;
  final double price;
  final String descripcion;
  bool isFavorite;

  ImageData({
    required this.imageName,
    required this.altText,
    required this.author,
    required this.price,
    required this.descripcion,
    required this.isFavorite,
  });
}

class ItemsWidget extends StatelessWidget {
  final List<ImageData> imagesData = [
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
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      childAspectRatio: (130 / 190),
      children: [
        for (int i = 0; i < imagesData.length; i++)
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  spreadRadius: 1,
                  blurRadius: 8,
                ),
              ],
            ),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              SingleItemScreen(imagesData[i])),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    child: Image.asset(
                      "assets/${imagesData[i].imageName}.png",
                      width: 120,
                      height: 120,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(
                  height: 60,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        imagesData[i].altText,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        imagesData[i].author,
                        style: const TextStyle(
                          color: Colors.black26,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$ ${imagesData[i].price.toStringAsFixed(2)}",
                        style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE57734),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Icon(
                          CupertinoIcons.add,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
      ],
    );
  }
}
