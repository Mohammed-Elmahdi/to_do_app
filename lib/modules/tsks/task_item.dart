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
  late NavigatorState navigator;

  @override
  void didChangeDependencies() {
    navigator = Navigator.of(context);
  }


  @override
  Widget build(BuildContext context) {
    // bool done=widget.taskModel.isDone;
    var size = MediaQuery.of(context).size;
    return Padding(
      padding:  EdgeInsets.only(top: 10,bottom: 5,),
      child: Container(
        height: size.height * .15,
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
                // borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),topRight: Radius.circular(10)),
               autoClose: true,
                spacing: 15,
                onPressed:(context){
                  widget.taskModel.isDone==false?
                  Navigator.pushNamed(context, EditTask.routeName,
                  arguments: widget.taskModel):{};
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
                height: size.height*.17,
                width: 5,
                color: widget.taskModel.isDone==false ?primaryColor:
                   Colors.green,
              ), //line
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.taskModel.title,
                      style: widget.taskModel.isDone==false ?
                      Theme.of(context)
                          .textTheme
                          .headline2!
                          .copyWith(fontSize: 19):
                      Theme.of(context)
                          .textTheme
                          .headline2!
                          .copyWith(color: Colors.green)

                    ),//title
                    Text(
                        widget.taskModel.description),//description
                  ],
                ),//title ,description
              ),
              InkWell(
                onTap: (){
                  widget.taskModel.isDone=!widget.taskModel.isDone;
                  updateTasksFromFirestore(widget.taskModel);
                  // setState(() {});
                },
                child: widget.taskModel.isDone==false?
                   Container(
                  margin: EdgeInsets.all(18),
                       decoration: BoxDecoration(
                       color: primaryColor,
                      borderRadius: BorderRadius.circular(12),
                         ),
                   padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                     child: Icon(Icons.check,color: Colors.white,))//Icon
                    :
                      Padding(
                        padding: const EdgeInsets.only(right: 18),
                        child: Text('Done!',
                 style: Theme.of(context).textTheme.subtitle1?.copyWith(
                  color: Colors.green,

                 ),
                 ),
                      )//DONE!
              ),
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
