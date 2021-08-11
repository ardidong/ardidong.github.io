import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  SectionTitle({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SelectableText(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.blue[900],
            fontSize: 32.0,
          ),
        ),
        Container(
          height: 3.0,
          width: 100.0,
          color: Colors.blueAccent,
        )
      ],
    );
  }
}
