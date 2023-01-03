import 'dart:io';
import 'dart:math' as Math;
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:image/image.dart' as Im;
import 'package:path_provider/path_provider.dart';

class ImageSizeCompressor {
  static Future<Uint8List> compressImage(Uint8List bytes) async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    int random = Math.Random().nextInt(10000);

    Im.Image? image = Im.decodeImage(bytes);
    Im.Image smallerImage = Im.copyResize(image!,
        width: 100,
        height: 100); // choose the size here, it will maintain aspect ratio

    var compressedImage = File('$path/img_$random.jpg')
      ..writeAsBytesSync(Im.encodeJpg(smallerImage, quality: 85));
    debugPrint("got old image as :${image.length}");
    debugPrint("got updated image as :${smallerImage.length}");
    return compressedImage.readAsBytesSync();
  }
}
