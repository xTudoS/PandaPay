import 'package:flutter/material.dart';

class PageRouter extends MaterialPageRoute {
  Widget _pageRouter;

  PageRouter(this._pageRouter)
      : super(
            builder: (BuildContext context) => _pageRouter);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return FadeTransition(
      opacity: animation,
      child: _pageRouter,
    );
  }
}