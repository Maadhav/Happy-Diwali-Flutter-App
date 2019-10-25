import 'package:flutter/material.dart';

class Info extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Happy Diwali !!',style: TextStyle(fontSize: 40),),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text('Made by ~ Maadhav Sharma',style: TextStyle(fontSize: 16, color: Colors.grey),),
            )
          ],
        ),
        
      ),
    );
  }
}