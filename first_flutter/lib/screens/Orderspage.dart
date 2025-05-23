import 'package:flutter/material.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pedidos"),
        backgroundColor: Colors.amber[600],
      ),
      body: Center(
        child: const Text('Aquí estarán tus Pedidos'),
      ),
    );
  }
}

