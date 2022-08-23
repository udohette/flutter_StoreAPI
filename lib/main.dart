import 'package:flutter/material.dart';
import 'package:flutter_firebase/screens/cartScreen.dart';
import 'package:flutter_firebase/screens/homeScreen.dart';
import 'package:flutter_firebase/screens/loginScreen.dart';
import 'package:flutter_firebase/screens/productCategory.dart';

void main() {
  runApp(MaterialApp(
      home: LoginScreen(),

    ),
  );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  List<Widget> pages = <Widget>[HomePage(), CartScreen(),ProductCategory()];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.white,

      body: pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(

        currentIndex: _selectedIndex,
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Shop'),
        BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Category')
      ],
        onTap: (value){
        setState((){
          _selectedIndex = value;
          print("Selected Index =  $_selectedIndex");
        });
        },
      ),
    ));
  }
}
