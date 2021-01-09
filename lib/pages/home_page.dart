import 'package:flutter/material.dart';
import 'package:web_app/widgets/drawer.dart';
import 'package:web_app/widgets/resolution_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  AnimationController _drawerController;
  Animation _drawerTween;
  bool isDrawerOpened = false;

  void _openCloseDrawer() {
    if (isDrawerOpened) {
      
      _drawerController.reverse();
      isDrawerOpened = false;
    } else {
      _drawerController.forward();
      isDrawerOpened = true;
    }
  }

  @override
  void initState() {
    super.initState();
    _drawerController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    final Animation _curveAnimation =
        CurvedAnimation(parent: _drawerController, curve: Curves.easeInOutCirc);
    _drawerTween = Tween(begin: -250.0, end: 0.0).animate(_curveAnimation);
  }

  @override
  Widget build(BuildContext context) {
    return ResolutionWidget(
      largeScreen: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            Row(
              children: [
                Column(
                  children: <Widget>[
                    AnimatedContainer(
                      duration: Duration(milliseconds: 400),
                      height: MediaQuery.of(context).size.height,
                      width: ResolutionWidget.isLargeScreen(context) ? 250 : 0,
                      child: Container(
                        child: MyDrawer(
                          drawerElevation: 0.0,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      child: Center(
                        child: SelectableText('Hello World!'),
                      ),
                    ),
                  ],
                )
              ],
            ),
            ResolutionWidget.isSmallScreen(context)
                ? Positioned(
                    right: 10,
                    top: 20,
                    child: IconButton(
                      icon: Icon(Icons.menu),
                      onPressed: () => _openCloseDrawer(),
                    ),
                  )
                : Container(),
            AnimatedBuilder(
              animation: _drawerTween,
              builder: (context, child) => Positioned(
                left: ResolutionWidget.isLargeScreen(context)
                    ? -250.0
                    : _drawerTween.value,
                child: Column(
                  children: <Widget>[
                    AnimatedContainer(
                      duration: Duration(milliseconds: 400),
                      height: MediaQuery.of(context).size.height,
                      width: 250,
                      child: Container(
                        child: MyDrawer(
                          drawerElevation: 0.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        drawerScrimColor: Colors.transparent,
        drawer: ResolutionWidget.isSmallScreen(context) ? MyDrawer() : null,
      ),
    );
  }
}
