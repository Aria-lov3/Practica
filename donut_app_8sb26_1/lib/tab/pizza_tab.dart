import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/pizza_tile.dart';

class PizzaTab extends StatelessWidget {
  final void Function(String name, double price) addItemToCart;

   PizzaTab({super.key, required this.addItemToCart});

  final List pizzaOnSale = [
    ['Carnes frias', '190', Colors.brown, "lib/images/pizza_carnes.png", 'Starbucks'],
    ['Champiñones', '189', Colors.red, "lib/images/pizza_champ.png", 'Krispy Kreme'],
    ['Peperoni', '195', Colors.blue, "lib/images/pizza_peperoni.png", "Dunkin' Donuts"],
    ['Vegetariana', '270', Colors.purple, "lib/images/pizza_vegetariana.png", 'Cafe del puerto'],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.6,
      ),
      itemCount: pizzaOnSale.length,
      itemBuilder: (context, index) {
        return PizzaTile(
          pizzaFlavor: pizzaOnSale[index][0],
          pizzaPrice: pizzaOnSale[index][1],
          pizzaColor: pizzaOnSale[index][2],
          pizzaImagePath: pizzaOnSale[index][3],
          pizzaProvider: pizzaOnSale[index][4],
          addItemToCart: addItemToCart, // Ahora sí se pasa la función
        );
      },
    );
  }
}