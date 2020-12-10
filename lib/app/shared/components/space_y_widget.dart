import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpaceY extends StatelessWidget {
  const SpaceY(
    this.value, {
    Key key,
  }) : super(key: key);

  final double value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: value.h);
  }
}
