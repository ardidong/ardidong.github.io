import 'package:flutter/material.dart';

class DrawerButton extends StatefulWidget {
  DrawerButton(
      {Key key, @required this.buttonIcon, @required this.sectionName});

  final IconData buttonIcon;
  final String sectionName;

  @override
  _DrawerButtonState createState() => _DrawerButtonState();
}

class _DrawerButtonState extends State<DrawerButton>
    with TickerProviderStateMixin {
  bool isHovered = false;
  Color iconColor = Colors.grey[700];
  Color buttonColor = Colors.grey[200];

  AnimationController _colorAnimationController;
  Animation _colorTween;

  @override
  void initState() {
    _colorAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 100));
    _colorTween = ColorTween(begin: Colors.grey[200], end: Colors.blue)
        .animate(_colorAnimationController);

    super.initState();
  }

  void _onMouseHover(PointerEvent details) {
    setState(() {
      isHovered = true;
      _colorAnimationController.forward();
    });
  }

  void _onMouseExit(PointerEvent details) {
    setState(() {
      isHovered = false;
      _colorAnimationController.reverse();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _colorAnimationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.0),
      child: MouseRegion(
        onHover: _onMouseHover,
        onExit: _onMouseExit,
        child: AnimatedBuilder(
          animation: _colorTween,
          builder: (context, child) => FlatButton(
            splashColor: Colors.white.withOpacity(0.3),
            color: _colorTween.value,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
            onPressed: () {},
            child:  Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Icon(
                    widget.buttonIcon,
                    size: 30.0,
                    color: (isHovered) ? Colors.white : Colors.grey[700],
                  ),
                ),
                Container(
                  child: Text(
                    widget.sectionName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      color: (isHovered) ? Colors.white : Colors.grey[700]
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
