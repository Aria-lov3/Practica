import 'package:flutter/material.dart';

class PizzaTile extends StatelessWidget {
  const PizzaTile({super.key, 
  required this.pizzaFlavor, 
  required this.pizzaPrice, 
  required this.pizzaColor, 
  required this.pizzaImagePath, 
  required this.pizzaProvider});
  
  
  final String pizzaFlavor;
  final String pizzaPrice;
  final dynamic pizzaColor;
  final String  pizzaImagePath;
  final String  pizzaProvider;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: pizzaColor[100],
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
                  color: pizzaColor[200],
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12),
                    bottomLeft: Radius.circular(12)
                  )
                ),
                child: Text('\$$pizzaPrice',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: pizzaColor[800]
                ),),
                )
              ],
            ),
            //imagen de la dona
            Padding(padding: const EdgeInsets.symmetric(
              vertical: 12, horizontal: 12),
              child: Image.asset(pizzaImagePath),
            ),
            //Nombre de la donut
            Text(
              pizzaFlavor,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            //espacio entre textos
            const SizedBox(height: 4),
            //nombre del proveedor
            Text(pizzaProvider, 
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