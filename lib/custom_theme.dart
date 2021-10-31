import 'package:flutter/material.dart';



  Color get whiteColor => Colors.white;
  Color get greyColor => Colors.grey;


  Color get darkColor =>  Colors.black;
  MaterialColor get darkSwatchColor =>  Colors.grey;
  Color get darkColorWithOpacity =>  Colors.black.withOpacity(0.4);

  Color get lightColor => Colors.white;
  Color get yellowColor => Colors.yellow;
  Color get greenColor => Colors.green;
  Color get activeIconColorColor => yellowColor;

  var customTheme = ThemeData(
      primaryColor: darkColor,
      primarySwatch: darkSwatchColor,
      accentColor: yellowColor,
      cardColor: lightColor,
      backgroundColor: darkColor,
      highlightColor: yellowColor,
      splashColor: greenColor,
      
      appBarTheme: AppBarTheme(
        color: darkColorWithOpacity,
        titleTextStyle: TextStyle(
          color: greyColor
        ),
        actionsIconTheme: IconThemeData(
          opacity: 0.8,
          color: greyColor
        ) 
      ),
      textTheme: TextTheme(
        bodyText1: TextStyle(color: greyColor),
        bodyText2: TextStyle(color: whiteColor),
        subtitle1: TextStyle(color: whiteColor),
        caption: TextStyle(color: greyColor)
      )
  );