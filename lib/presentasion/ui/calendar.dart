import 'package:flutter/material.dart';
import 'package:time_planner/time_planner.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  List<TimePlannerTask> tasks = [
    TimePlannerTask(
      // background color for task
      color: Colors.purple,
      // day: Index of header, hour: Task will be begin at this hour
      // minutes: Task will be begin at this minutes
      dateTime: TimePlannerDateTime(day: 0, hour: 14, minutes: 30),
      // Minutes duration of task
      minutesDuration: 90,
      // Days duration of task (use for multi days task)
      daysDuration: 1,
      onTap: () {},
      child: Text(
        'this is a task',
        style: TextStyle(color: Colors.grey[350], fontSize: 12),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: TimePlanner(
        // time will be start at this hour on table
        startHour: 6,
        // time will be end at this hour on table
        endHour: 23,
        // each header is a column and a day
        headers: [
          TimePlannerTitle(
            date: "3/10/2021",
            title: "sunday",
          ),
          TimePlannerTitle(
            date: "3/11/2021",
            title: "monday",
          ),
          TimePlannerTitle(
            date: "3/12/2021",
            title: "tuesday",
          ),
        ],
        // List of task will be show on the time planner
        tasks: tasks,
        style: TimePlannerStyle(
          backgroundColor: Colors.blueGrey[900],
          // default value for height is 80
          cellHeight: 60,
          // default value for width is 90
          cellWidth: 60,
          dividerColor: Colors.white,
          showScrollBar: true,
          horizontalTaskPadding: 5,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
      ),
    );
  }
}
