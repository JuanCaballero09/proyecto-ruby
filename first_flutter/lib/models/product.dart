import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String id;
  final String name;
  final String price;

  const Product({
    required this.id,
    required this.name,
    required this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      price: json['price'], // Formato español como "12.000"
    );
  }

  @override
  List<Object?> get props => [id, name, price];
}
