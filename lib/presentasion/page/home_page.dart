import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';
import '../provider/animation_slide_bar.dart';
import '../provider/color_custom.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

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
          icon: const Icon(Icons.menu_rounded),
        ),
      ),
      body: Container(
        color: Colors.amber,
      ),
    );
  }
}
