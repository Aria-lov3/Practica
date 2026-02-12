
import 'package:flutter/material.dart';
import 'package:flutter_application_1/tab/burger_tab.dart';
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
 List<Widget> myTabs = [
    //donut tab
    const MyTab(iconPath: 'lib/icons/donut.png', iconName: 'Donut'),
    //burger tab
    const MyTab(iconPath: 'lib/icons/burger.png', iconName: 'Burger'),
    //smoothie tab
    const MyTab(iconPath: 'lib/icons/smoothie.png', iconName: 'Smoothie'),
    //pancake tab
    const MyTab(iconPath: 'lib/icons/pancakes.png', iconName: 'Pancake'),
    //pizza tab
    const MyTab(iconPath: 'lib/icons/pizza.png', iconName: 'Pizza'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        // Icono de la izquierda
        leading: Icon(Icons.menu, color: Colors.grey[800]),
        // Iconos de la derecha
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: Icon(Icons.person, color: Colors.grey[800]),
          ),
        ],
      ),
      body: Column(
        //1. Texo principal
        children: [Padding(
          padding: const EdgeInsets.only(left: 24.0),
          child: Row(
            children: [
              Text('I want to ', style: TextStyle(fontSize: 24)),
              Text(
                'Eat',
               style: TextStyle(
                //Tamaño de la letra
                fontSize: 24,
                //Negritas
                fontWeight: FontWeight.bold,
                //Subrayado
                decoration: TextDecoration.underline,
                )
              ),
            ],
          ),
        ),
        //2. Pestañas (TabBar)
         TabBar(tabs: myTabs),
         Expanded(child:TabBarView(
          children:[DonutTab(),BurguerTab(),
                  SmoothieTab(),
                  PancakeTab(),
                  PizzaTab(),]))
        ]
      ),
    ),
    );
  }
}
