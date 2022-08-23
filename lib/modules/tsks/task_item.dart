import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:to_do_new/models/task_model.dart';
import 'package:to_do_new/shared/components/components.dart';
import 'package:to_do_new/shared/styles/colors.dart';
import 'package:to_do_new/utils/add_task_firebase.dart';
import 'edit_task.dart';

class TaskItem extends StatefulWidget {
  TaskModel taskModel;

  TaskItem(this.taskModel);

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  bool click=true;

  late NavigatorState navigator;

  @override
  void didChangeDependencies() {
    navigator = Navigator.of(context);
  }


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding:  EdgeInsets.only(top: 10,bottom: 5,),
      child: Container(
        height: size.height * .13,
        margin: EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
        child: Slidable(
          startActionPane: ActionPane(
            extentRatio: 0.4,
            motion: DrawerMotion(),
            // openThreshold: .5,
            closeThreshold: .5,
            dragDismissible: false,
            children: [
              SlidableAction(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),topLeft: Radius.circular(10)),
                autoClose: true,
                spacing: 15,
                onPressed: (context) {
                  // showLoading(context, 'Loading...');
                  showMessage(
                      context,
                      'Are you sure?',
                      'Yes',
                     ( () {
                        deleteTask();
                        navigator.pop(context);
                      }),
                      NegActionName: 'Cancel',
                      NegActionCallBack: () {
                        navigator.pop(context);
                      },
                      );
                },

                foregroundColor: Colors.white,
                backgroundColor: Theme.of(context).colorScheme.error,
                icon: Icons.delete,
                label: 'Delete',
              ),

              SlidableAction(
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),topRight: Radius.circular(10)),
               autoClose: true,
                spacing: 15,
                onPressed:(context){
                  Navigator.pushNamed(context, EditTask.routeName,
                  arguments: widget.taskModel);
                },
                backgroundColor: Color(0xFF21B7CA),
                foregroundColor: Colors.white,
                icon: Icons.edit,
                label: 'Edit',
              ),

            ],
          ),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.all(8),
                height: size.height*.12,
                width: 3,
                color: primaryColor,
              ), //line
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.taskModel.title,
                      style: Theme.of(context)
                          .textTheme
                          .headline2!
                          .copyWith(fontSize: 19),
                    ),
                    Text(
                        widget.taskModel.description),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                child: Icon((click==false)? Icons.check
                :Icons.account_balance_wallet_sharp,
                  color: Colors.white,
                  size: 30,
                ),
              ),//Icon
            ],
          ),
        ),
      ),
    );
  }

  void deleteTask() {
    deleteTaskFromFireStore(widget.taskModel) ;
      setState(() {

      });
  }

}
