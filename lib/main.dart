import 'package:flutter/material.dart';
import 'package:proyecto/views/formulario1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(title: ''),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black, // Establecer el fondo de la aplicación a negro
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.black, // Establecer el color del AppBar a negro
      ),
      
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch, // Ajustar el ancho de los hijos al ancho del Column
        
        children: [
          Container(
             height: MediaQuery.of(context).size.height * 0.55, // Ajusta el valor según tus necesidades
           color: Colors.blue,
            child: Image.asset(
            'assets/imagen1.png',
               fit: BoxFit.cover,
           ),
          ),
           Text(
      'Descubre un mundo de conocimiento en nuestra libreria virtual',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white,
        fontSize: 28.0,
        fontWeight: FontWeight.bold,
      ),
    ),

          Divider(), // Línea en la mitad de la pantalla
          // Nuevo widget Text en la división de las dos secciones
   
          Expanded(
            flex: 2,
            child: Container(
              color: const Color.fromARGB(255, 7, 7, 7), // Color de la segunda sección (puedes cambiarlo si lo deseas)
              child: Center(
                child: Text(
                  'Si te gusta leer, estas en el lugar correcto.',
                    style: TextStyle(
                 color: Color.fromARGB(255, 124, 121, 121),
                 fontSize: 18.0, // Ajusta el valor según tus necesidades
                   ),
                ),
              ),
            ),
          ),
          
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(bottom: 20.0, left: 32.0, right: 32.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.6,
          height: 60.0,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
              context,
               MaterialPageRoute(builder: (context) => formulario1()),
            );// Agrega la lógica de registro aquí.
            },
            style: ElevatedButton.styleFrom(
              primary: Color(0xFFC67C4E),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            child: Text(
              'Registrarse',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
