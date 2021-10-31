import 'package:clean_arch_with_flutter/core/domain/entities/space_media_entity.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class CustomVideoPlayer extends StatefulWidget {
  final SpaceMediaEntity spaceMediaEntity;
  const CustomVideoPlayer({ Key? key, required this.spaceMediaEntity }) : super(key: key);

  @override
  _CustomVideoPlayerState createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {

  bool get isYoutubeVideo => widget.spaceMediaEntity.mediaUrl.contains('youtube');
  YoutubePlayerController? _youtubeController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if(isYoutubeVideo && widget.spaceMediaEntity.mediaUrl != null) _loadYoutube(widget.spaceMediaEntity);
  }

  @override
  void dispose(){
    _youtubeController?.close();
    super.dispose();
  }

  _loadYoutube(SpaceMediaEntity spaceMedia){
    if(_youtubeController == null){
      
      final videoId = _filterVideoId(spaceMedia.mediaUrl);

      _youtubeController = YoutubePlayerController(
        initialVideoId: videoId,
        params: YoutubePlayerParams(
          showControls: false,
          showFullscreenButton: true,
          autoPlay:  true,
          mute: true,
          loop: true
        )
      );
    }
  }

  String _filterVideoId(String url) {
    final indexOfLastSlash = url.lastIndexOf('/');
    final indexOfComplement = url.indexOf('?');
    final containsComplement = indexOfComplement != -1;
    final videoId = containsComplement ? url.substring(indexOfLastSlash + 1, indexOfComplement) : url.substring(indexOfLastSlash);
    return videoId;
  }

  void _launchURL(String url) async {
    final canOpenLink = await canLaunch(url);
    if (canOpenLink) await launch(url);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: _youtubeController != null ? 
        YoutubePlayerIFrame( controller: _youtubeController, aspectRatio: 16/9) :
        !isYoutubeVideo ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment:  CrossAxisAlignment.center,
          children: [
            Text('Não foi possível reproduzir o vídeo.'),
            TextButton(onPressed: (){
              _launchURL(widget.spaceMediaEntity.mediaUrl);
            }, child: Text('Tentar abrir no navegador'))
          ],
        ) : Container()
    );
  }
}