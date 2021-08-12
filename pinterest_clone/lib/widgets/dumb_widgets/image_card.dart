import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../core/models/image_model.dart';
import 'package:transparent_image/transparent_image.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({this.imageData});

  final ImageData imageData;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Image.network(imageData.imageUrl, fit: BoxFit.cover),
        // child: FadeInImage.memoryNetwork(
        //   placeholder: kTransparentImage,
        //   image: imageData.imageUrl,
        //   fit: BoxFit.cover,
        // ),
      ),
    );
  }
}
