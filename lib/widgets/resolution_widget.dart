import 'package:flutter/material.dart';

class ResolutionWidget extends StatelessWidget {
  final Widget largeScreen;
  final Widget smallScreen;

  ResolutionWidget({Key key, @required this.largeScreen, this.smallScreen})
      : super(key: key);

  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 800;
  }

  static bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < 800;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        if (constraint.maxWidth > 1200) {
          return largeScreen;
        } else {
          return smallScreen ?? largeScreen;
        }
      },
    );
  }
}
