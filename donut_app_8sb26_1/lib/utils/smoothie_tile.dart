import 'package:flutter/material.dart';

class SmoothieTile extends StatelessWidget {
  const SmoothieTile({super.key, 
  required this.smoothieFlavor, 
  required this.smoothiePrice, 
  required this.smoothieColor, 
  required this.smoothieImagePath, 
  required this. smoothieProvider});
  
  
  final String smoothieFlavor;
  final String smoothiePrice;
  final dynamic smoothieColor;
  final String smoothieImagePath;
  final String  smoothieProvider;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: smoothieColor[100],
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
                  color: smoothieColor[200],
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12),
                    bottomLeft: Radius.circular(12)
                  )
                ),
                child: Text('\$$smoothiePrice',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: smoothieColor[800]
                ),),
                )
              ],
            ),
            //imagen de la dona
            Padding(padding: const EdgeInsets.symmetric(
              vertical: 12, horizontal: 12),
              child: Image.asset(smoothieImagePath),
            ),
            //Nombre de la donut
            Text(
              smoothieFlavor,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            //espacio entre textos
            const SizedBox(height: 4),
            //nombre del proveedor
            Text( smoothieProvider, 
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