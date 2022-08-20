import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:calendar_timeline/src/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:to_do_new/models/task_model.dart';
import 'package:to_do_new/modules/tsks/task_item.dart';
import 'package:to_do_new/shared/styles/my_theme.dart';
import 'package:to_do_new/utils/add_task_firebase.dart';

class TasksTap extends StatefulWidget {
  @override
  State<TasksTap> createState() => _TasksTapState();
}

class _TasksTapState extends State<TasksTap> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CalendarTimeline(
            initialDate: selectedDate,
            firstDate: DateTime.now().subtract(Duration(days: 365)),
            lastDate: DateTime.now().add(Duration(days: 365)),
            onDateSelected: (date) {
              //to make tasks appear in specific date
              if (date == null) return;
              selectedDate = date;
              setState(() {});
            },
            //return number which you select
            leftMargin: 20,
            monthColor: MyThemeData.BlackColor,
            dayColor: MyThemeData.BlackColor,
            activeDayColor: MyThemeData.primaryColor,
            activeBackgroundDayColor: MyThemeData.WhiteColor,
            dotsColor: Theme.of(context).primaryColor,
            selectableDayPredicate: (date) => true,
            locale: 'en_ISO',
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot<TaskModel>>(
              stream: getTaskFromFirebaseUsingStream(selectedDate),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text('Somthing went wrong');
                }
                //how to get data by provider to rebuild changes on all screens by notify listener
                //or by using streamer instead of future
                List<TaskModel> tasks =
                    snapshot.data?.docs.map((e) => e.data()).toList() ?? [];
                //map to convert list from type to another

                return ListView.builder(
                  itemBuilder: (context, index) {
                    return TaskItem(tasks[index]);
                  },
                  itemCount: tasks.length,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
