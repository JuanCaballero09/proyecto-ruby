import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/comida_bloc.dart';
import '../widgets/comida_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[100],
      appBar: AppBar(
        title: const Text('La Terraza del Pri'),
        backgroundColor: Colors.amber[600],
        foregroundColor: Colors.white,
      ),
      body: BlocBuilder<ComidaBloc, ComidaState>(
        builder: (context, state) {
          if (state is ComidasCargadas) {
            return ListView.builder(
              itemCount: state.comidas.length,
              itemBuilder: (context, index) {
                return ComidaCard(comida: state.comidas[index]);
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}