import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/comida_bloc.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ComidaBloc()..add(CargarComidas()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'La Terraza del Pri',
        theme: ThemeData(
          primarySwatch: Colors.amber,
          fontFamily: 'Arial',
        ),
        home: const HomeScreen(),
      ),
    );
  }
}