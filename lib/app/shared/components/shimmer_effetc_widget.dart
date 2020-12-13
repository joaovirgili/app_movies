import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffect extends StatelessWidget {
  final Widget child;
  final bool enable;

  const ShimmerEffect({
    @required this.child,
    Key key,
    this.enable = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return enable
        ? Shimmer.fromColors(
            baseColor: Colors.grey[300],
            highlightColor: Colors.grey[100],
            child: child,
          )
        : child;
  }
}
