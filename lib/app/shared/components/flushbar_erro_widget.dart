import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final flushBarError = Flushbar(
  duration: Duration(seconds: 2),
  backgroundColor: Colors.red,
  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 100.w),
  borderRadius: 8,
  message: 'Erro ao obter os dados',
  boxShadows: [
    BoxShadow(
      color: Colors.black45,
      offset: Offset(0.0, 2.0),
      blurRadius: 3.0,
    )
  ],
);
