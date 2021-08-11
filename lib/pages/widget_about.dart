import 'package:flutter/material.dart';
import 'package:web_app/widgets/section_title.dart';

class AboutWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(64.0),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: <Widget>[
          SectionTitle(
            title: "About",
          ),
          Container(
            margin: EdgeInsets.only(top: 32.0, bottom: 16.0),
            child: Center(
              child: SizedBox(
                height: 256.0,
                width: 256.0,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://avatars0.githubusercontent.com/u/45361198?s=400&u=b05b5a20a3bd81e95274f79f1bbfa83eca65fe4a&v=4"),
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 16.0),
              child: SelectableText(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
                style: TextStyle(fontSize: 16.0, height: 1.5),
              ),
            ),
          )
        ],
      ),
    );
  }
}
