import 'package:flutter/material.dart';

import '../../../../../shared/components/components.dart';
import '../../../../../shared/components/shimmer_effetc_widget.dart';
import '../../../../../shared/styles.dart';

class MovieTextInfoWidget extends StatelessWidget {
  const MovieTextInfoWidget({
    @required this.title,
    @required this.content,
    this.isLoading = false,
    Key key,
  }) : super(key: key);

  final String title;
  final String content;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppStyles.textFieldHintStyle,
          ),
          SpaceY(8),
          ShimmerEffect(
            enable: isLoading,
            child: isLoading
                ? Container(height: 50, color: Colors.grey)
                : Text(
                    content,
                    style: AppStyles.movieInfoTextContent,
                  ),
          ),
        ],
      ),
    );
  }
}
