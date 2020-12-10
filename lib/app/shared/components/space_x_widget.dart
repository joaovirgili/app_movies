import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpaceX extends StatelessWidget {
  const SpaceX(
    this.value, {
    Key key,
  }) : super(key: key);

  final double value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: value.h);
  }
}
