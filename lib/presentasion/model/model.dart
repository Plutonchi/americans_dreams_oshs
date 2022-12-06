import 'package:flutter/material.dart';

//Navigation Menu
class NavigationModel {
  String? title;
  IconData? icon;

  NavigationModel({this.title, this.icon});
}

List<NavigationModel> navigationItems = [
  NavigationModel(title: "Dashboard", icon: Icons.insert_chart,),
  NavigationModel(title: "Errors", icon: Icons.error),
  NavigationModel(title: "Search", icon: Icons.search),
  NavigationModel(title: "Notifications", icon: Icons.notifications),
  NavigationModel(title: "Settings", icon: Icons.settings),
  NavigationModel(title: "Sign Out", icon: Icons.logout_outlined),
];
