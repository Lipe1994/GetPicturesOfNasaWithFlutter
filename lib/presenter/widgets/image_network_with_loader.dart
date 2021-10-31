import 'package:flutter/material.dart';

class ImageNetworkWithLoader extends StatelessWidget {
  final String url;
  const ImageNetworkWithLoader({ Key? key, required this.url }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: InteractiveViewer(
        minScale: 0.1,
        maxScale: 4,
        child: Image.network(
          url, 
          fit: BoxFit.cover, 
          loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress){

            if(loadingProgress == null){
              return child;
            }

            return Center(
              child:  CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null ? 
                  loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! :
                  null,
              )
            );
          }
        ),
      )
    );
  }
}