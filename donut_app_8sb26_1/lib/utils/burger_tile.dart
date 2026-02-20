import 'package:flutter/material.dart';

class BurgerTile extends StatelessWidget {
  const BurgerTile({super.key, 
  required this.burgerFlavor, 
  required this.burgerPrice, 
  required this.burgerColor, 
  required this.burgerImagePath, 
  required this.burgerProvider});
  
  
  final String burgerFlavor;
  final String burgerPrice;
  final dynamic burgerColor;
  final String  burgerImagePath;
  final String  burgerProvider;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: burgerColor[100],
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
                  color: burgerColor[200],
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12),
                    bottomLeft: Radius.circular(12)
                  )
                ),
                child: Text('\$$burgerPrice',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: burgerColor[800]
                ),),
                )
              ],
            ),
            //imagen de la dona
            Padding(padding: const EdgeInsets.symmetric(
              vertical: 12, horizontal: 12),
              child: Image.asset(burgerImagePath),
            ),
            //Nombre de la donut
            Text(
              burgerFlavor,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            //espacio entre textos
            const SizedBox(height: 4),
            //nombre del proveedor
            Text(burgerProvider, 
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