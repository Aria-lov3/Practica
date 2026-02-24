import 'package:flutter/material.dart';
import 'package:flutter_application_1/tab/cart_item.dart';

class CartPage extends StatelessWidget {
  final List<CartItem> cartItems;
  // Agregamos este parámetro para recibir la función de eliminar
  final Function(int index) removeItem;

  const CartPage({
    super.key, 
    required this.cartItems, 
    required this.removeItem // Requerido en el constructor
  });

  @override
  Widget build(BuildContext context) {
    int totalItems = cartItems.fold(0, (sum, item) => sum + item.quantity);
    double totalPrice = cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
        backgroundColor: Colors.pink[100],
      ),
      body: cartItems.isEmpty 
        ? const Center(child: Text("Your cart is empty"))
        : Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    final item = cartItems[index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.pink[50],
                        child: Text(item.quantity.toString()),
                      ),
                      title: Text(item.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text('\$${item.price} c/u'),
                      // Agregamos un botón de eliminar al final de cada fila
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '\$${(item.price * item.quantity).toStringAsFixed(2)}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 8),
                          IconButton(
                            icon: const Icon(Icons.delete_outline, color: Colors.red),
                            onPressed: () {
                              // Llamamos a la función que nos pasaron
                              removeItem(index);
                              // Opcional: Cerrar y volver a abrir para refrescar (o usar un Stateful para mayor fluidez)
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              // Resumen final
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Total Items:", style: TextStyle(fontSize: 16)),
                        Text("$totalItems", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Total Payable:", style: TextStyle(fontSize: 20)),
                        Text("\$${totalPrice.toStringAsFixed(2)}", 
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.pink)),
                      ],
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () { /* Lógica de pago */ },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink[200],
                          padding: const EdgeInsets.all(16)
                        ),
                        child: const Text("CHECKOUT", style: TextStyle(color: Colors.white, letterSpacing: 2)),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
    );
  }
}