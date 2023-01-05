import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';
import '../provider/animation_slide_bar.dart';
import '../provider/color_custom.dart';
import '../widgets/bottomnavybar.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

int currentIndex = 0;

class _HomePageState extends State<HomePage> {
  final _controller = SidebarXController(selectedIndex: 0, extended: true);

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: AnimationSlideBar(controller: _controller),
      appBar: AppBar(
        backgroundColor: canvasColor,
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          icon: Icon(Icons.menu_rounded),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(),
        ),
      ),
      bottomNavigationBar: bottom(currentIndex: 0),
    );
  }
}
