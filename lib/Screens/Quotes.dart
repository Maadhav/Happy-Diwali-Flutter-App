import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:share/share.dart';
import 'dart:math';

class Quotes extends StatefulWidget {
  @override
  _QuotesState createState() => _QuotesState();
}

class _QuotesState extends State<Quotes> {
  List data;

  @override
  Widget build(BuildContext context) {
    return Container(
         decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("Assets/back.png"),
            fit: BoxFit.cover,
          ),
        ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
        body: Container(
          child: Center(
            child: FutureBuilder(
              future: DefaultAssetBundle.of(context)
                  .loadString('data_repo/quotes.json'),
              builder: (context, snapshot) {
                var new_data = json.decode(snapshot.data.toString());

                if (snapshot.connectionState == ConnectionState.done) {
                  return ListView.builder(
                      itemBuilder: (BuildContext context, int index) {
                    final _random = new Random();
                    for (var i = 0; i <1; i++) {
                     
                       index = _random.nextInt(128);
                     
                    }
                    return Container(
                      color: Colors.transparent,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    new_data[index]['name'],
                                    style: TextStyle(fontSize: 20,fontFamily: 'Nunito'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 30,
                                      child: IconButton(
                                        splashColor: Colors.pink,
                                          icon: Icon(Icons.send,color: Colors.pink[600],),
                                          tooltip:
                                              'Share with your Friends and Family',
                                          onPressed: () {
                                            Share.share(new_data[index]['name']);
                                          }),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  });
                } else
                  return CircularProgressIndicator();
              },
            ),
          ),
        ),
      ),
    );
  }
}
