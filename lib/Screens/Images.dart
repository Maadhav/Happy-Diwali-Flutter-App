import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:cached_network_image/cached_network_image.dart';


class Images extends StatefulWidget {
  @override
  _ImagesState createState() => _ImagesState();
}

class _ImagesState extends State<Images> with AutomaticKeepAliveClientMixin  {
  List data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('data_repo/images.json'),
            builder: (context, snapshot) {
              var new_data = json.decode(snapshot.data.toString());

              if (snapshot.connectionState == ConnectionState.done) {
                return ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      final _random = new Random();
                  for (var i = 0; i <1; i++) {
                   
                     index = _random.nextInt(50);
                      
                  }
                  print(index);

                  void _share() async {
                    // File _image;
                    // onLoading(true);
                    // var response = await http.get(new_data[index]['image']);
                    // var filepath = await ImagePickerSaver.saveFile(
                    //   fileData: response.bodyBytes,
                    // );
                    // onLoading(false);
                    var request = await HttpClient().getUrl(Uri.parse(new_data[index]['image']));
var response = await request.close();
                    Uint8List bytes = await consolidateHttpClientResponseBytes(response);
                    // String BASE24_IMAGE = filepath;
                    // final ByteData bytes = await rootBundle.load(BASE24_IMAGE);
                    await Share.file('Happy Diwali', 'diwali.jpg', bytes, 'image/jpg');
                  }

                  return Container(
                    color: Colors.black,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Card(
                          color: Colors.pink[600],
                          borderOnForeground: true,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            elevation: 10,
                            child: Column(
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                                  child: FadeInImage(
                                    image:
                                        CachedNetworkImageProvider(new_data[index]['image']),
                                        placeholder: AssetImage('Assets/loading.gif'),
                                        fadeInDuration: Duration(seconds: 1)
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(Icons.share,color: Colors.white,size: 30,),
                                  onPressed: _share,
                                )
                              ],
                            )),
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
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
