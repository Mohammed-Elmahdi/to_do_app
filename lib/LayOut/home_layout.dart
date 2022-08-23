import 'package:flutter/material.dart';
import 'package:to_do_new/modules/bottomSheet/add_task_bottom_sheet.dart';
import 'package:to_do_new/modules/settings/settings.dart';
import 'package:to_do_new/modules/tsks/tasks_tap.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.todoTitle,
          style: Theme.of(context).textTheme.headline1,
        ),
        centerTitle: true,
      ),
      body: taps[currentIndex],
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          onTap: (index) {
            currentIndex = index;
            setState(() {});
          },
          currentIndex: currentIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.list), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: StadiumBorder(
            side: BorderSide(
          color: Colors.white,
          width: 4,
        )),
        child: Icon(Icons.add),
        onPressed: () {
          BottomSheetAddTask();
        },
      ),
    );
  }

  List<Widget> taps = [TasksTap(), Settings()];

  BottomSheetAddTask() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: AddTaskBottomSheet(),
          ),
        );
      },
      isScrollControlled: true,
    );
  }
}
