import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/smoothie_tile.dart';

class SmoothieTab extends StatelessWidget {
  SmoothieTab({super.key});
  
  final List smoothieOnSale = [
    // donutFlavor, donutPrice, donutColor, donutImagePath, donutProvider
    [
      'Bayas',
      '100',
      Colors.brown,
      "lib/images/smot_bayas.png",
      'Starbucks',
    ],
    [
      'Fresa',
      '89',
      Colors.red,
      "lib/images/Smot_fresa.png",
      'Krispy Kreme',
    ],
    [
      'Naranja',
      '95',
      Colors.blue,
      "lib/images/smot_naranja.png",
      "Dunkin' Donuts",
    ],
    ['Cereza', '70', Colors.purple, "lib/images/smot_cereza.png", 'Cafe del puerto'],
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
      itemCount: smoothieOnSale.length,
      //Lo que se va a construir
      itemBuilder: (context, index) {
      return SmoothieTile(
        smoothieFlavor: smoothieOnSale[index][0],
        smoothiePrice: smoothieOnSale[index][1],
        smoothieColor: smoothieOnSale[index][2],
        smoothieImagePath: smoothieOnSale[index][3],
        smoothieProvider: smoothieOnSale[index][4],
        );
      },
    );
  }
}
