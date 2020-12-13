import 'package:flutter/material.dart';

import '../../../../../shared/colors.dart';
import '../../../../../shared/styles.dart';

class GenreLabelWidget extends StatelessWidget {
  const GenreLabelWidget({
    @required this.genre,
    Key key,
  }) : super(key: key);

  final String genre;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: genre == '' ? 75 : null,
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.gray02),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(genre.toUpperCase(), style: AppStyles.genreLabel),
    );
  }
}
