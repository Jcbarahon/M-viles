import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SellPage extends StatefulWidget {
  const SellPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SellPageState createState() => _SellPageState();
}

class _SellPageState extends State<SellPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();

  String _selectedPaymentMethod = 'Tarjeta'; // Método de pago predeterminado

  final List<String> _paymentMethods = ['Tarjeta', 'PayPal', 'Otros'];

  Widget _buildPaymentForm() {
    switch (_selectedPaymentMethod) {
      case 'Tarjeta':
        return Column(
          children: [
            TextField(
              controller: _cardNumberController,
              decoration: const InputDecoration(labelText: 'Número de Tarjeta'),
            ),
            TextField(
              controller: _expiryDateController,
              decoration:
                  const InputDecoration(labelText: 'Fecha de Vencimiento'),
            ),
            TextField(
              controller: _cvvController,
              decoration: const InputDecoration(labelText: 'CVV'),
            ),
          ],
        );
      case 'PayPal':
        return Column(
          children: [
            TextField(
              controller: _emailController,
              decoration:
                  const InputDecoration(labelText: 'Correo Electrónico'),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Contraseña'),
            ),
          ],
        );
      default:
        return const SizedBox.shrink();
    }
  }

  Future<void> _confirmPurchase(BuildContext context) async {
    try {
      String methodDetails = '';
      switch (_selectedPaymentMethod) {
        case 'Tarjeta':
          methodDetails =
              'Número de Tarjeta: ${_cardNumberController.text}, Fecha de Vencimiento: ${_expiryDateController.text}, CVV: ${_cvvController.text}';
          break;
        case 'PayPal':
          methodDetails =
              'Correo Electrónico: ${_emailController.text}, Contraseña: ${_passwordController.text}';
          break;
        default:
          methodDetails = 'Otros';
          break;
      }

      await FirebaseFirestore.instance.collection('pagos').add({
        'metodo_pago': _selectedPaymentMethod,
        'detalles_metodo': methodDetails,
      });

      // Mostrar un diálogo de compra realizada
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Compra realizada'),
            content: const Text('¡Gracias por su compra!'),
            actions: <Widget>[
              TextButton(
                child: const Text('Aceptar'),
                onPressed: () {
                  Navigator.of(context).pop(); // Cerrar el diálogo
                  Navigator.of(context).pop(); // Volver a la página de inicio
                },
              ),
            ],
          );
        },
      );
    } catch (error) {
      // Manejar cualquier error que ocurra durante la escritura en la base de datos
      // ignore: avoid_print
      print("Error al guardar en Firestore: $error");
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error al realizar la compra')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFe9ddd1),
      appBar: AppBar(
        title: const Text('Método de pago'),
        backgroundColor: Colors.black87,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButtonFormField(
              value: _selectedPaymentMethod,
              items: _paymentMethods.map((method) {
                return DropdownMenuItem(
                  value: method,
                  child: Text(method),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedPaymentMethod = value.toString();
                });
              },
              decoration: const InputDecoration(
                labelText: 'Método de Pago',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            _buildPaymentForm(),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _confirmPurchase(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(248, 227, 154, 95),
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
              ),
              child: const Text(
                'Confirmar Compra',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
