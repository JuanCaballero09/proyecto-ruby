import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/comida_bloc.dart';
import '../widgets/comida_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;
  int _selectedIndex = 0;


  static const List<Widget> _widgetOptions = <Widget>[
    Center(child: Text('Inicio')),
    Center(child: Text('Pedidos')),
    Center(child: Text('Este es tu Perfil')),
  ];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Incrementar',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Pedidos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
