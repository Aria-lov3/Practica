import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/cart_page.dart';
import 'package:flutter_application_1/tab/burger_tab.dart';
import 'package:flutter_application_1/tab/cart_item.dart';
import 'package:flutter_application_1/tab/donut_tab.dart';
import 'package:flutter_application_1/tab/pancake_tab.dart';
import 'package:flutter_application_1/tab/pizza_tab.dart';
import 'package:flutter_application_1/tab/smoothie_tab.dart';
import 'package:flutter_application_1/utils/my_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // LISTA DE PRODUCTOS EN EL CARRITO
  List<CartItem> cartItems = [];

  // 1. FUNCIÓN PARA AGREGAR AL CARRITO
  void addItemToCart(String name, double price) {
    setState(() {
      int index = cartItems.indexWhere((item) => item.name == name);
      if (index != -1) {
        cartItems[index].quantity++;
      } else {
        cartItems.add(CartItem(name: name, price: price));
      }
    });
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$name añadido al carrito'), 
        duration: const Duration(milliseconds: 800)
      ),
    );
  }

  // 2. FUNCIÓN PARA ELIMINAR DEL CARRITO (Conexión para CartPage)
  void removeItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  // CÁLCULOS DINÁMICOS
  int get totalQuantity => cartItems.fold(0, (sum, item) => sum + item.quantity);
  double get totalPrice => cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));

  @override
  Widget build(BuildContext context) {
    List<Widget> myTabsContent = [
      DonutTab(addItemToCart: addItemToCart),
      BurgerTab(addItemToCart: addItemToCart), 
      SmoothieTab(addItemToCart: addItemToCart),
      PancakeTab(addItemToCart: addItemToCart),
      PizzaTab(addItemToCart: addItemToCart),
    ];

    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 24.0),
            child: Icon(Icons.menu, color: Colors.grey[800], size: 36),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: Icon(Icons.person, color: Colors.grey[800], size: 36),
            )
          ],
        ),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 36, vertical: 18),
              child: Row(
                children: [
                  Text("I want to ", style: TextStyle(fontSize: 24)),
                  Text("EAT", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, decoration: TextDecoration.underline)),
                ],
              ),
            ),

            const TabBar(
              tabs: [
                MyTab(iconPath: 'lib/icons/donut.png', iconName: 'Donut'),
                MyTab(iconPath: 'lib/icons/burger.png', iconName: 'Burger'),
                MyTab(iconPath: 'lib/icons/smoothie.png', iconName: 'Smoothie'),
                MyTab(iconPath: 'lib/icons/pancakes.png', iconName: 'Pancake'),
                MyTab(iconPath: 'lib/icons/pizza.png', iconName: 'Pizza'),
              ],
            ),

            Expanded(
              child: TabBarView(children: myTabsContent),
            ),

            // BARRA INFERIOR
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(top: BorderSide(color: Colors.grey[200]!))
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '$totalQuantity Items | \$${totalPrice.toStringAsFixed(2)}',
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      const Text('Delivery Charges Included', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CartPage(
                            cartItems: cartItems, 
                            removeItem: removeItem, 
                          ),
                        ),
                      ).then((_) => setState(() {})); // Refresca al volver si hubo cambios
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink[200],
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    ),
                    child: const Text('View Cart', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}