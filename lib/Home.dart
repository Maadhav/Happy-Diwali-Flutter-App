import 'package:flutter/material.dart';
import 'Screens/Quotes.dart';
import 'Screens/Images.dart';
import 'Screens/Info.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
   final List<Widget> _children = [
   Quotes(),
   Images(),
   Info(),
 ];
  void onTabTapped(int index) {
     setState(() {
      _currentIndex = index;
     });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Happy Diwali 2019'),
        backgroundColor: Colors.pink[600],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.format_quote),
            title: Text('Quotes')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.image),
            title: Text('Greeting Cards')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            title: Text('About'),
          ),
        ],
      ),
    );
  }
}