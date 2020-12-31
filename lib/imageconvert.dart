import 'package:flutter/cupertino.dart';

class ImageConversion extends StatefulWidget{

  final Function(GlobalKey key) builder;

   ImageConversion({Key key,this.builder}) : super(key: key);


  @override
  _ImageState createState()=>_ImageState();
}

class _ImageState extends State<ImageConversion>{

  final GlobalKey globalKey=GlobalKey();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RepaintBoundary(
      key: globalKey,
      child: widget.builder(globalKey),
    );
  }
}