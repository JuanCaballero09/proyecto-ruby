import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/comida.dart';

abstract class ComidaEvent {}

class CargarComidas extends ComidaEvent {}

abstract class ComidaState {}

class ComidasInicial extends ComidaState {}

class ComidasCargadas extends ComidaState {
  final List<Comida> comidas;
  ComidasCargadas(this.comidas);
}

class ComidaBloc extends Bloc<ComidaEvent, ComidaState> {
  ComidaBloc() : super(ComidasInicial()) {
    on<CargarComidas>((event, emit) {
      final comidas = [
        Comida(nombre: 'Hamburguesa criolla', descripcion: 'Con huevo y arepa', precio: 18000),
        Comida(nombre: 'Perro caliente', descripcion: 'Con papas, queso y piña', precio: 12000),
        Comida(nombre: 'Salchipapa', descripcion: 'Papas fritas con salchichas', precio: 15000),
        Comida(nombre: 'Mazorcada', descripcion: 'Con queso, pollo, tocineta y salsa', precio: 20000),
      ];
      emit(ComidasCargadas(comidas));
    });
  }
}