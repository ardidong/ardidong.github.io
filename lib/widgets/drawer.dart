import 'package:flutter/material.dart';
import 'drawer_button.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({this.drawerElevation = 5.0});

  final double drawerElevation;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: drawerElevation,
      child: Center(
        child: Scrollbar(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                DrawerButton(
                    buttonIcon: Icons.home_outlined, sectionName: "Home"),
                DrawerButton(
                    buttonIcon: Icons.person_outlined, sectionName: "About"),
                DrawerButton(
                    buttonIcon: Icons.description_outlined,
                    sectionName: "Resume"),
                DrawerButton(
                    buttonIcon: Icons.paste_outlined, sectionName: "Portfolio")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
