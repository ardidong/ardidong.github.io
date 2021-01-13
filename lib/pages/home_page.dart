import 'package:flutter/material.dart';
import 'package:web_app/widgets/drawer.dart';
import 'package:web_app/widgets/home_widget.dart';
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

  void _openCloseDrawer(BuildContext context) {
    Scaffold.of(context).openDrawer();
    if (!isDrawerOpened) {
      //_drawerController.reverse();
      print("open drawer");
      isDrawerOpened = true;
    } else {
      //_drawerController.forward();
      isDrawerOpened = false;
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
    print(MediaQuery.of(context).size.width);
    return ResolutionWidget(
      largeScreen: Scaffold(
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
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      colorFilter: new ColorFilter.mode(
                          Colors.black.withOpacity(0.9), BlendMode.dstATop),
                      image: NetworkImage(
                          'https://images.pexels.com/photos/1591305/pexels-photo-1591305.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  width: ResolutionWidget.isLargeScreen(context)
                      ? MediaQuery.of(context).size.width - 250.0
                      : MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: ListView(
                    children: [
                      HomeWidget(),
                    ],
                  ),
                )
              ],
            ),
            ResolutionWidget.isSmallScreen(context)
                ? Builder(
                    builder: (context) => Positioned(
                      right: 10,
                      top: 20,
                      child: IconButton(
                        icon: Icon(Icons.menu),
                        onPressed: () => _openCloseDrawer(context),
                      ),
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
