
import 'dart:convert';
import 'package:clean_arch_with_flutter/core/domain/entities/space_media_entity.dart';
import 'package:clean_arch_with_flutter/infra/models/space_media_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../static_mocks/space_media.dart';

void main(){
  final tSpaceMediaModel = SpaceMediaModel(
    description: 'Meteors can be colorful. While the human eye usually cannot discern many colors.',
    mediaType: 'image',
    mediaUrl: 'https://apod.nasa.gov/apod/image/2102/MeteorStreak_Kuszaj_1080.jpg',
    title: 'A Colorful Quadrantid Meteor'
  );

  test('Should be a subclass of SpaceMediaEntity', (){
    expect(tSpaceMediaModel, isA<SpaceMediaEntity>() );
  });

  test('Should return a valid model', (){
     final Map<String, dynamic> jsonMap = json.decode(spaceMediaMock);

     final result = SpaceMediaModel.fromJson(jsonMap);

     expect(result, tSpaceMediaModel);
  });

  test('should return a json map containing the proper data', () {

    final expectedMap = {
      "explanation": "Meteors can be colorful. While the human eye usually cannot discern many colors.",
      "media_type": "image",
      "title": "A Colorful Quadrantid Meteor",
      "url": "https://apod.nasa.gov/apod/image/2102/MeteorStreak_Kuszaj_1080.jpg"
    };

    final result = tSpaceMediaModel.toJson();

    expect(result, expectedMap);
  });
}