import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/smoothie_tile.dart';

class SmoothieTab extends StatelessWidget {
  final void Function(String name, double price) addItemToCart;

 SmoothieTab({super.key, required this.addItemToCart});

  final List smoothieOnSale = [
    ['Bayas', '100', Colors.brown, "lib/images/smot_bayas.png", 'Starbucks'],
    ['Fresa', '89', Colors.red, "lib/images/Smot_fresa.png", 'Krispy Kreme'],
    ['Naranja', '95', Colors.blue, "lib/images/smot_naranja.png", "Dunkin' Donuts"],
    ['Cereza', '70', Colors.purple, "lib/images/smot_cereza.png", 'Cafe del Puerto'],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.6,
      ),
      itemCount: smoothieOnSale.length,
      itemBuilder: (context, index) {
        return SmoothieTile(
          smoothieFlavor: smoothieOnSale[index][0],
          smoothiePrice: smoothieOnSale[index][1],
          smoothieColor: smoothieOnSale[index][2],
          smoothieImagePath: smoothieOnSale[index][3],
          smoothieProvider: smoothieOnSale[index][4],
          addItemToCart: addItemToCart, // Ahora el nombre coincide perfectamente
        );
      },
    );
  }
}