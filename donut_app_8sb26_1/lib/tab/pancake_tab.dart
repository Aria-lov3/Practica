import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/pancake_tile.dart';

class PancakeTab extends StatelessWidget {
  final void Function(String name, double price) addItemToCart;

   PancakeTab({super.key, required this.addItemToCart});

  final List pancakeOnSale = [
    ['Arandanos', '85', Colors.brown, "lib/images/pancake_arandanos.png", 'Starbucks'],
    ['Castañas', '110', Colors.red, "lib/images/pancake_castañas.png", 'Italian coffe'],
    ['Pistache', '195', Colors.blue, "lib/images/pancake_pistache.png", "El molinillo"],
    ['Mantequilla', '70', Colors.purple, "lib/images/pancake_mantequilla.png", 'Cafe del puerto'],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.6,
      ),
      itemCount: pancakeOnSale.length,
      itemBuilder: (context, index) {
        return PancakeTile(
          pancakeFlavor: pancakeOnSale[index][0],
          pancakePrice: pancakeOnSale[index][1],
          pancakeColor: pancakeOnSale[index][2],
          pancakeImagePath: pancakeOnSale[index][3],
          pancakeProvider: pancakeOnSale[index][4],
          addItemToCart: addItemToCart, // Ahora sí se pasa la función
        );
      },
    );
  }
}