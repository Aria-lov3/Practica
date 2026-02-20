import 'package:flutter/material.dart';

class PancakeTile extends StatelessWidget {
  const PancakeTile({super.key, 
  required this.pancakeFlavor, 
  required this.pancakePrice, 
  required this.pancakeColor, 
  required this.pancakeImagePath, 
  required this.pancakeProvider});
  
  
  final String pancakeFlavor;
  final String pancakePrice;
  final dynamic pancakeColor;
  final String  pancakeImagePath;
  final String  pancakeProvider;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: pancakeColor[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            //etiqeuta del precio
            Row(
              //alinear a la derecha
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 8,
                ),
                decoration: BoxDecoration(
                  color: pancakeColor[200],
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12),
                    bottomLeft: Radius.circular(12)
                  )
                ),
                child: Text('\$$pancakePrice',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: pancakeColor[800]
                ),),
                )
              ],
            ),
            //imagen de la dona
            Padding(padding: const EdgeInsets.symmetric(
              vertical: 12, horizontal: 12),
              child: Image.asset(pancakeImagePath),
            ),
            //Nombre de la donut
            Text(
             pancakeFlavor,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            //espacio entre textos
            const SizedBox(height: 4),
            //nombre del proveedor
            Text(pancakeProvider, 
            style: TextStyle(
              color: Colors.grey[600]),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.favorite_border, color: Colors.pink[400]),
                  Text("Add",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    decoration: TextDecoration.underline,
                  ),)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}