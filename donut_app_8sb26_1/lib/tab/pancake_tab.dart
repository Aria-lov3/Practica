import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/pancake_tile.dart';

class PancakeTab extends StatelessWidget {
  PancakeTab({super.key});

  final List pancakeOnSale = [
    // donutFlavor, donutPrice, donutColor, donutImagePath, donutProvider
    [
      'Arandanos',
      '85',
      Colors.brown,
      "lib/images/pancake_arandanos.png",
      'Starbucks',
    ],
    [
      'Castañas',
      '110',
     Colors.red,
      "lib/images/pancake_castañas.png",
      'Italian coffe',
    ],
    [
      'Pistache',
      '195',
      Colors.blue,
      "lib/images/pancake_pistache.png",
      "El molinillo",
    ],
    ['Matequilla', '70', Colors.purple, "lib/images/pancake_mantequilla.png", 'Cafe del puerto'],
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
      itemCount:  pancakeOnSale.length,
      //Lo que se va a construir
      itemBuilder: (context, index) {
      return PancakeTile(
         pancakeFlavor:  pancakeOnSale[index][0],
         pancakePrice:  pancakeOnSale[index][1],
         pancakeColor:  pancakeOnSale[index][2],
         pancakeImagePath:  pancakeOnSale[index][3],
         pancakeProvider:  pancakeOnSale[index][4],
        );
      },
    );
  }
}
