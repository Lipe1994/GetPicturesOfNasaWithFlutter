import 'package:clean_arch_with_flutter/core/domain/entities/space_media_entity.dart';
import 'package:clean_arch_with_flutter/core/util/date_formater.dart';
import 'package:clean_arch_with_flutter/custom_theme.dart';
import 'package:clean_arch_with_flutter/presenter/controllers/home_store.dart';
import 'package:clean_arch_with_flutter/presenter/widgets/custom_app_bar.dart';
import 'package:clean_arch_with_flutter/presenter/widgets/custom_video_player.dart';
import 'package:clean_arch_with_flutter/presenter/widgets/image_network_with_loader.dart';
import 'package:clean_arch_with_flutter/presenter/widgets/page_slider.dart';
import 'package:clean_arch_with_flutter/presenter/widgets/show_modal_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

class PicturePage extends StatefulWidget {
  PicturePage({ Key? key}) : super(key: key);

  @override
  _PicturePageState createState() => _PicturePageState();
}

class _PicturePageState extends ModularState<PicturePage, HomeStore> {
  DateTime dateState = DateTime.now();

  @override
  void initState(){
    super.initState();
    store.getSpaceMediaFromDate(dateState);
  }

  void alterDateLeft(){
    var dateLeft = dateState.add(Duration(days: -1));
    print('alterDateLeft');
    alterDateState(dateLeft);
  }
  void alterDateRight(){
    var dateRight = dateState.add(Duration(days: 1));
    print('alterDateRight');
    alterDateState(dateRight);
  }

  void alterDateState(DateTime dateTime){
    if(dateTime != dateState && dateTime.compareTo(DateTime.now()) <= 0 ){

      dateState = dateTime;
      store.getSpaceMediaFromDate(dateState);
    }
  }

  void openCalendar() async {
    var datePicked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1995, 06, 16),
      lastDate: DateTime.now(), );

      if(datePicked != null)
        alterDateState(datePicked);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(title: 'Imagens da nasa', openCalendar: openCalendar),
      backgroundColor: darkColorWithOpacity,
      body: ScopedBuilder(
        store: store,
        onLoading: (context) => Center(child: CircularProgressIndicator(),),
        onError: (context, error) => Center(
          child: Text(
            'Ocorreu um erro, desculpe-me',
            style: Theme.of(context).textTheme.caption,
          ),
        ),
        onState: (context, SpaceMediaEntity spaceMediaEntity){
          return PageSlider(
            info: DateFormater.dateToDatedMMy(dateState),
            swiprRight: alterDateRight,
            swipeLeft: alterDateLeft,
            onSlideUp: ()=> showDescriptionBottomSheet(context: context, title: spaceMediaEntity.title, description: spaceMediaEntity.description), 
            child: spaceMediaEntity.mediaType == 'video' ? 
              CustomVideoPlayer(spaceMediaEntity: spaceMediaEntity) : 
              spaceMediaEntity.mediaType == 'image' ? 
                ImageNetworkWithLoader(url: spaceMediaEntity.mediaUrl) :
                Container() 
            );
        },
      )
    );
  }
}