import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

class RegisterUser extends StatefulWidget {
  const RegisterUser({Key? key}) : super(key: key);

  @override
  _RegisterUserState createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  File? _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFe9ddd1),
      appBar: AppBar(
        title: const Text('Registro de Usuario'),
        backgroundColor: Colors.black87,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Nombre',
                prefixIcon: Icon(Icons.person, color: Color(0xFFC67C4E)),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFC67C4E)),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Correo electrónico',
                prefixIcon: Icon(Icons.email, color: Color(0xFFC67C4E)),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFC67C4E)),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Contraseña',
                prefixIcon: Icon(Icons.lock, color: Color(0xFFC67C4E)),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFC67C4E)),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            _image != null
                ? Image.file(_image!)
                : const SizedBox(), // Mostrar imagen seleccionada si existe
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _getImage,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFC67C4E),
                textStyle: const TextStyle(color: Colors.white),
              ),
              child: const Text('Seleccionar Imagen'),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _submit,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFC67C4E),
                textStyle: const TextStyle(color: Colors.white),
              ),
              child: const Text('Registrarse'),
            ),
          ],
        ),
      ),
    );
  }

  void _submit() async {
    final email = _emailController.text;
    final password = _passwordController.text;

    try {
      await FirebaseFirestore.instance.collection('clientes').add({
        'name': _nameController.text,
        'email': email,
        'password': password,
        'imageUrl': _image != null ? _image!.path : null,
      });

      print('Usuario registrado en Firestore');
      _nameController.clear();
      _emailController.clear();
      _passwordController.clear();
      setState(() {
        _image = null;
      });
    } catch (e) {
      print('Error al registrar usuario en Firestore: $e');
    }
  }

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }
}
