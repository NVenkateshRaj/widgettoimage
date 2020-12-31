import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:widgettoimage/convert.dart';
import 'package:widgettoimage/imageconvert.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WTI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
GlobalKey key;
  Uint8List imageBytes1;
  List<Uint8List> imageBytes;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WTI"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ImageConversion(
                builder:(key) {
                  this.key=key;
                  return Container(
                    color: Colors.green,
                    child: ListTile(
                      title: Text("Hari Krishnan"),
                      subtitle: Text("Junior Mobile Application Developer"),
                      leading: CircleAvatar(
                        backgroundImage: ExactAssetImage("assets/images/hari.jpg"),
                        backgroundColor: Colors.transparent,
                      ),
                      trailing: Text("VGTS"),
                    ),
                  );
                }
            ),
            Container(
              child: buildImageView(imageBytes1),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:()async{
          final bytes=await capture(key,context);

          setState(() {
            this.imageBytes1=bytes;
          });

          // const url = 'whatsapp://send?phone=${918608602032}';
          // if (await canLaunch(url)) {
          //   await launch(url);
          // }
          // else {
          //   throw 'Could not launch $url';
          // }

        },
        backgroundColor: Colors.green,
        child: Icon(Icons.send,color: Colors.white,),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }


  Widget buildImageView(Uint8List bytes)
  {
    return bytes!=null?Container(
      margin: EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
         Container(
           child:  Image.memory(bytes),
         ),
          IconButton(
            onPressed: (){
              onShare(context,bytes);
            },
            color: Colors.green,
            iconSize: 20,
            icon: Icon(Icons.share,),
          )
        ],
      ),
    ):Container();

    //
  }


}
