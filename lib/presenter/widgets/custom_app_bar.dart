import 'package:clean_arch_with_flutter/custom_theme.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with  PreferredSizeWidget {
  final String title;
  final Function openCalendar;

  const CustomAppBar({required this.title, required this.openCalendar, Key? key, }) : super(key: key);



    @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 4,
      centerTitle: true,
      title: Text(title, style: Theme.of(context).appBarTheme.titleTextStyle,),
      actions: [
        IconButton(onPressed: openCalendar as Function(), icon: Icon(Icons.calendar_today))
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

}