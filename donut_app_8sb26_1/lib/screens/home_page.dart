import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      backgroundColor: Colors.transparent,
      //icono de la izquierda
      leading: Icon(Icons.menu, color: Colors.grey[800],),
      //ICONO DE LA DRECHA
      actions:[
        Padding(
          padding: const EdgeInsets.only(right: 24.0),
          child: Icon(Icons.person, color: Colors.grey[800],),
        ),
      ],
    ),
    body: Column(
      //1. texto principal

      //2. pestañas (TarBar)

      //3. contenmido (TarBarView)
      
      //4. carrito (Cart)
    )
    );
  }
}