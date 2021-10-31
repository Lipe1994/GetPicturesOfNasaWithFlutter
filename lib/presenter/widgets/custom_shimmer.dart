import 'package:clean_arch_with_flutter/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  final Widget child;
  const CustomShimmer({ Key? key, required this.child }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      child: Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: child,
      ),
      baseColor: greyColor, 
      highlightColor: whiteColor);
  }
}