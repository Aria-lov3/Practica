import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/burger_tile.dart';

class BurgerTab extends StatelessWidget {
  final void Function(String name, double price) addItemToCart;

  BurgerTab({super.key, required this.addItemToCart});

  final List burgerOnSale = [
    ['Queso', '110', Colors.brown, "lib/images/burger_chees.png", 'San Burger'],
    ['Tocino', '189', Colors.red, "lib/images/tocino_burger.png", 'Krispy Chiken'],
    ['Hongos', '195', Colors.blue, "lib/images/fungy_burger.png", "Carl's jr"],
    ['Vegetariana', '75', Colors.amberAccent, "lib/images/vegetarian_burger.png", 'Wendys'],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.6, // Ajustado para consistencia
      ),
      itemCount: burgerOnSale.length,
      itemBuilder: (context, index) {
        return BurgerTile(
          burgerFlavor: burgerOnSale[index][0],
          burgerPrice: burgerOnSale[index][1],
          burgerColor: burgerOnSale[index][2],
          burgerImagePath: burgerOnSale[index][3],
          burgerProvider: burgerOnSale[index][4],
          addItemToCart: addItemToCart,
        );
      },
    );
  }
}