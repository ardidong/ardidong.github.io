import 'package:flutter/material.dart';
import 'resolution_widget.dart';


class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ResolutionWidget.isLargeScreen(context)
          ? MediaQuery.of(context).size.width - 250.0
          : MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.all(128.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "Ardian Dwi Rifai",
          style: TextStyle(
            fontSize: 64.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
