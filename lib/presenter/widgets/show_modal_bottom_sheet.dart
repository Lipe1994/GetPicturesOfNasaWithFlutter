import 'package:clean_arch_with_flutter/custom_theme.dart';
import 'package:flutter/material.dart';

void showDescriptionBottomSheet({
  required BuildContext context,
  required String title,
  required String description,
}){
  showModalBottomSheet(context: context, 
    backgroundColor: darkColorWithOpacity,
    isDismissible: true,
    
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10))
    ),
    builder: (_){
      return ListView(children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text(title, textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyText2,),
              SizedBox(height: 10),
              Text(description, textAlign: TextAlign.justify, style: Theme.of(context).textTheme.bodyText2,)
            ],

          )
        )
      ],);
    });
}