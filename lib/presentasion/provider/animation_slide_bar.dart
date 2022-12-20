import 'dart:io';

import 'package:american_dream_osh/presentasion/ui/calendar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sidebarx/sidebarx.dart';

import '../ui/authpage/LogIn.dart';
import '../ui/pay.dart';
import '../widgets/upload_images.dart';
import 'color_custom.dart';

class AnimationSlideBar extends StatefulWidget {
  AnimationSlideBar({
    Key? key,
    required SidebarXController controller,
  })  : _controller = controller,
        super(key: key);

  final SidebarXController _controller;

  @override
  State<AnimationSlideBar> createState() => _AnimationSlideBarState();
}

class _AnimationSlideBarState extends State<AnimationSlideBar> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller: widget._controller,
      theme: SidebarXTheme(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: canvasColor,
          borderRadius: BorderRadius.circular(20),
        ),
        textStyle: const TextStyle(color: Colors.white),
        selectedTextStyle: const TextStyle(color: Colors.white),
        itemTextPadding: const EdgeInsets.only(left: 30),
        selectedItemTextPadding: const EdgeInsets.only(left: 30),
        itemDecoration: BoxDecoration(
          border: Border.all(color: canvasColor),
        ),
        selectedItemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: actionColor.withOpacity(0.37),
          ),
          gradient: const LinearGradient(
            colors: [accentCanvasColor, canvasColor],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.28),
              blurRadius: 30,
            )
          ],
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
          size: 20,
        ),
      ),
      extendedTheme: SidebarXTheme(
        width: 200,
        decoration: BoxDecoration(
          color: canvasColor,
        ),
        margin: EdgeInsets.only(right: 10),
      ),
      footerDivider: divider,
      headerBuilder: (context, extended) {
        return SafeArea(
          child: SizedBox(
            height: 100,
            child: Column(
              children: [
                uploadImage(),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Text(
                    user.email.toString(),
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      items: [
        SidebarXItem(
          icon: Icons.home,
          label: 'Home',
          onTap: () {},
        ),
        SidebarXItem(
          icon: Icons.search,
          label: 'Search',
          onTap: () {},
        ),
        SidebarXItem(
          icon: Icons.payment,
          label: 'Pay',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Pay(),
              ),
            );
          },
        ),
        SidebarXItem(
          icon: Icons.calendar_month_outlined,
          label: 'Calendar',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Calendar()),
            );
          },
        ),
        SidebarXItem(
            icon: Icons.logout_outlined,
            label: "Log Out",
            onTap: () {
              FirebaseAuth.instance.signOut().then(
                    (value) => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LogIn(),
                      ),
                    ),
                  );
            }),
      ],
    );
  }
}
