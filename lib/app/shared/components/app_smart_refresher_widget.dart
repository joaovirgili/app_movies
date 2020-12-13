import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../colors.dart';

class AppSmartRefresher extends StatefulWidget {
  final Function() onRefresh;
  final bool isLoading;
  final Widget child;
  final RefreshController controller;

  const AppSmartRefresher({
    @required this.onRefresh,
    @required this.child,
    @required this.controller,
    Key key,
    this.isLoading = false,
  }) : super(key: key);

  @override
  _AppSmartRefresherState createState() => _AppSmartRefresherState();
}

class _AppSmartRefresherState extends State<AppSmartRefresher> {
  @override
  void didUpdateWidget(covariant AppSmartRefresher oldWidget) {
    super.didUpdateWidget(oldWidget);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (oldWidget.isLoading && !widget.isLoading) {
        widget.controller.refreshCompleted();
      } else if (!oldWidget.isLoading && widget.isLoading) {
        widget.controller.requestLoading();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      header: Theme(
        data: Theme.of(context).copyWith(primaryColor: AppColors.blue01),
        child: MaterialClassicHeader(),
      ),
      controller: widget.controller,
      onRefresh: widget.onRefresh,
      child: widget.child,
    );
  }
}
