import 'package:clean_arch_with_flutter/core/domain/entities/space_media_entity.dart';

class SpaceMediaModel extends SpaceMediaEntity{

  SpaceMediaModel({ 
    required String mediaType,
    required String title,
    required String mediaUrl,
    required String description
  }) : 
    super(mediaType: mediaType, title: title, mediaUrl: mediaUrl, description: description );


  factory SpaceMediaModel.fromJson(Map<String, dynamic> json) => SpaceMediaModel(
    description: json['explanation'],
    mediaType: json['media_type'],
    title: json['title'],
    mediaUrl: json['url']
  );

  Map<String, dynamic> toJson() => {
    'explanation': description,
    'media_type': mediaType,
    'title': title,
    'url': mediaUrl 
  };

}