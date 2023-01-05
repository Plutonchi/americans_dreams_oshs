import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';

class bottom extends StatefulWidget {
  bottom({super.key, this.currentIndex});
  int? currentIndex;

  @override
  State<bottom> createState() => _bottomState();
}

class _bottomState extends State<bottom> {
  @override
  Widget build(BuildContext context) {
    return BottomNavyBar(
      selectedIndex: widget.currentIndex!,
      onItemSelected: (index) {
        setState(() {
          widget.currentIndex = index;
        });
      },
      items: <BottomNavyBarItem>[
        BottomNavyBarItem(
          icon: Icon(Icons.home),
          title: Text(
            'Главная',
          ),
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.calendar_today_outlined),
          title: Text('Расписание'),
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.payment),
          title: Text('Оплата'),
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.calendar_month),
          title: Text('Календарь'),
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.person),
          title: Text('Профиль'),
        ),
      ],
    );
  }
}
