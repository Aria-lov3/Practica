import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/pizza_tile.dart' show PizzaTile;

class PizzaTab extends StatelessWidget {
   PizzaTab({super.key});
   final List pizzaOnSale = [
    // donutFlavor, donutPrice, donutColor, donutImagePath, donutProvider
    [
      'Carnes frias',
      '190',
      Colors.brown,
      "lib/images/pizza_carnes.png",
      'Starbucks',
    ],
    [
      'Champiñones',
      '189',
      Colors.red,
      "lib/images/pizza_champ.png",
      'Krispy Kreme',
    ],
    [
      'Peperoni',
      '195',
      Colors.blue,
      "lib/images/pizza_peperoni.png",
      "Dunkin' Donuts",
    ],
    ['vegetariana', '270', Colors.purple, "lib/images/pizza_vegetariana.png", 'Cafe del puerto'],
  ];

  @override
  Widget build(BuildContext context) {
   return GridView.builder(
      //Se encarga de acomodar elementos dentro del grid
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //Cantidad de columnas
      crossAxisCount: 2,
      //relacion de aspecto
      childAspectRatio: 1/1.6),
      //Cantidad de elementos
      itemCount: pizzaOnSale.length,
      //Lo que se va a construir
      itemBuilder: (context, index) {
      return PizzaTile(
        pizzaFlavor: pizzaOnSale[index][0],
        pizzaPrice: pizzaOnSale[index][1],
        pizzaColor: pizzaOnSale[index][2],
        pizzaImagePath: pizzaOnSale[index][3],
        pizzaProvider: pizzaOnSale[index][4],
        );
      },
    );
  }
}