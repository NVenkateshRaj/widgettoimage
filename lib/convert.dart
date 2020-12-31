import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:share/share.dart';


var directory;
Future capture(GlobalKey key,BuildContext context)async {
  if (key == null) {
    return null;
  }
  else {
    RenderRepaintBoundary boundry = key.currentContext.findRenderObject();
    ui.Image image = await boundry.toImage(pixelRatio: 10);
    ByteData bytes = await image.toByteData(format: ui.ImageByteFormat.png);
    final pngBytes = bytes.buffer.asUint8List();
    directory = await getExternalStorageDirectory();
    String path = p.join(directory.path,"image.png");
    File file = File(path)..create(recursive: true);
    file.writeAsBytesSync(pngBytes) as Uint8List;
    // return pngBytes;
  }
}

onShare(BuildContext context,var bytes) async {
  final RenderBox box = context.findRenderObject();
  await Share.shareFiles(['${directory.path}/image.png'],subject: "hari", sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
}