import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/product_bloc.dart';
import '../bloc/product_event.dart';
import '../bloc/product_state.dart';
import '../models/product.dart';
import 'product_detail_page.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildMenuPage(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductInitial) {
          return Center(
            child: ElevatedButton(
              onPressed: () {
                context.read<ProductBloc>().add(FetchProducts());
              },
              child: const Text('Cargar Productos'),
            ),
          );
        } else if (state is ProductLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ProductLoaded) {
          final categories = [
            'perro',
            'hamburguesa',
            'salchipapa',
            'salvajada',
            'asado',
            'sandwish',
            'adicional',
            'bebida'
          ];

          return ListView(
            padding: const EdgeInsets.all(8),
            children: categories.map((category) {
              final items = state.products
                  .where((p) => p.name.toLowerCase().contains(category))
                  .toList();
              if (items.isEmpty) return const SizedBox.shrink();
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category.toUpperCase(),
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Colors.amber[900],
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  ...items.map((product) => Card(
                        color: Colors.amber[100],
                        child: ListTile(
                          title: Text(product.name),
                          subtitle: Text(
                            '\$${product.price}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ProductDetailPage(product: product),
                              ),
                            );
                          },
                        ),
                      )),
                  const SizedBox(height: 16),
                ],
              );
            }).toList(),
          );
        } else if (state is ProductError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(state.message,
                    style: const TextStyle(color: Colors.red)),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    context.read<ProductBloc>().add(FetchProducts());
                  },
                  child: const Text('Reintentar'),
                ),
              ],
            ),
          );
        } else {
          return const Center(child: Text('Estado desconocido'));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      _buildMenuPage(context), // Página del menú
      const Center(child: Text('Carrito (en construcción)')),
      const Center(child: Text('Perfil (en construcción)')),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Menú del Restaurante'),
      ),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.amber[800],
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu),
            label: 'Menú',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Carrito',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
