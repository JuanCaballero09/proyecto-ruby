import 'package:flutter/material.dart';
import '../models/comida.dart';

class ComidaCard extends StatelessWidget {
  final Comida comida;

  const ComidaCard({super.key, required this.comida});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 246, 200, 75), // salmón
      margin: const EdgeInsets.all(10),
      child: ListTile(
        title: Text(
          comida.nombre,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(comida.descripcion),
        trailing: Text('\$${comida.precio.toStringAsFixed(0)}'),
      ),
    );
  }
}