import 'package:clean_arch_with_flutter/core/util/debounce.dart';
import 'package:clean_arch_with_flutter/presenter/widgets/custom_shimmer.dart';
import 'package:flutter/material.dart';

class PageSlider extends StatelessWidget {
  final VoidCallback onSlideUp;
  final VoidCallback swipeLeft;
  final VoidCallback swiprRight;
  final String info;
  final Widget child;
  
  PageSlider({ 
    Key? key,    
    required this.onSlideUp,
    required this.child, 
    required this.swipeLeft, 
    required this.swiprRight, required this.info}) : super(key: key);

  final _debouncer = Debounce(debounceTimeInmilliseconds: 300);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (update){
        print('update vertical');
        if(update.delta.dy < 0){
          _debouncer.run((){
            print('Deslizou para cima');
            onSlideUp();
          });
        }
      },
      onHorizontalDragUpdate: (update){
        print('update horizontal');
        if(update.delta.dx < 0){
          _debouncer.run((){
            print('Deslizou para direita');
            swiprRight();
          });
        }else if(update.delta.dx > 0){
          _debouncer.run((){
            print('Deslizou para esquerda');
            swipeLeft();
          });
        }
      },
      child: Container(
        height: double.infinity,
        width:  double.infinity,
        child: Stack(
          children: [
            child,
            
            Positioned(

              child: Container(
                width: double.infinity,
                child: CustomShimmer(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: kToolbarHeight * 2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                              Text(
                                info,
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.bodyText1,
                              ), 
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                              Icon(
                                Icons.keyboard_arrow_left_outlined,
                                size: 35,
                              ),  
                              Icon(
                                Icons.keyboard_arrow_right_outlined,
                                size: 35,
                              ),  
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Icon(
                              Icons.keyboard_arrow_up,
                              size: 35,
                            ),
                            Text(
                              "Descrição",
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ],
                        ),
                      ),
                    ]
                )
              )
            )
          )
          ],
        ),
      ),
    );
  }
}