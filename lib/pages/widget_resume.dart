import 'package:flutter/material.dart';
import 'package:web_app/widgets/section_title.dart';

class ResumeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(64.0),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: SectionTitle(title: "Resume"),
    );
  }
}
