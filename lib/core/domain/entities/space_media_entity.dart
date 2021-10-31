import 'package:equatable/equatable.dart';

class SpaceMediaEntity extends Equatable{
  final String description;
  final String mediaType;
  final String title;
  final String mediaUrl;

  SpaceMediaEntity({ required this.mediaType, required this.title, required this.mediaUrl, required this.description});

  @override
  List<Object?> get props => [
    description,
    mediaType,
    title,
    mediaUrl
  ];


}