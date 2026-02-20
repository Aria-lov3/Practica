import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/donut_tile.dart';

class BurguerTab extends StatelessWidget {
  BurguerTab({super.key});

    final List donutOnSale = [
    // donutFlavor, donutPrice, donutColor, donutImagePath, donutProvider
    [
      'Queso',
      '110',
      Colors.brown,
      "lib/images/burger_chees.png",
      'San Burger',
    ],
    [
      'Tocino',
      '189',
      Colors.red,
      "lib/images/tocino_burger.png",
      'Krispy Chiken',
    ],
    [
      'Hongos',
      '195',
      Colors.blue,
      "lib/images/fungy_burger.png",
      "Carl's jr",
    ],
    ['Vegetariana', '75', Colors.amberAccent, "lib/images/vegetarian_burger.png", 'Wendys'],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      //Se encarga de acomodar elementos dentro del grid
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //Cantidad de columnas
      crossAxisCount: 2,
      //relacion de aspecto
      childAspectRatio: 1/1.9),
      //Cantidad de elementos
      itemCount: donutOnSale.length,
      //Lo que se va a construir
      itemBuilder: (context, index) {
      return DonutTile(
        donutFlavor: donutOnSale[index][0],
        donutPrice: donutOnSale[index][1],
        donutColor: donutOnSale[index][2],
        donutImagePath: donutOnSale[index][3],
        donutProvider: donutOnSale[index][4],
        );
      },
    );
  }
}
