import 'package:flutter/material.dart';

class ImageUtils {
  static String getImagePath(String name, {String format: 'png'}) {
    return 'assets/image/$name.$format';
  }

  static Widget loadAssetImage(String name, {double width, double height, BoxFit fit}) {
    return Image.asset(
      getImagePath(name),
      width: width,
      height: height,
      fit: fit,
    );
  }
}
