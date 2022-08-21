import 'package:flutter/material.dart';
import 'package:to_do_new/models/task_model.dart';
import 'package:to_do_new/shared/components/components.dart';
import 'package:to_do_new/utils/add_task_firebase.dart';

class EditTask extends StatefulWidget {

  @override
  State<EditTask> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<EditTask> {

  var selectedDate = DateTime.now();
  var formKey = GlobalKey<FormState>(); //textFormField
  String title = '';
  String description = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16), topRight: Radius.circular(16)),
          ),
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Edit Task',
                style: Theme.of(context)
                    .textTheme
                    .headline1
                    ?.copyWith(color: Colors.black),
                textAlign: TextAlign.center,
              ), //add new
              Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        // labelStyle: Theme.of(context).textTheme.bodyText1,
                        labelText: 'Title',
                      ),
                      onChanged: (text) {
                        title = text;
                      },
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Please enter task title';
                        }
                        return null;
                      },
                    ), //title
                    // SizedBox(height: .001,),
                    TextFormField(
                      style: TextStyle(
                        color: Colors.green,
                      ),
                      maxLines: 4,
                      minLines: 4,
                      decoration: InputDecoration(
                        labelText: 'Description',
                        // labelStyle: Theme.of(context).textTheme.bodyText1,
                      ),
                      onChanged: (text) {
                        description = text;
                      },
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Please enter task description';
                        }
                        return null;
                      },
                    ), //description
                  ],
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                'Select Time',
              ), //select time
              SizedBox(
                height: 8,
              ),
              InkWell(
                onTap: () {
                  OpenDatePicker();
                },
                child: Text(
                  '${selectedDate.year} - ${selectedDate.month} - ${selectedDate.day}',
                  textAlign: TextAlign.center,
                ),
              ), //date
              SizedBox(
                height: 12,
              ),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    // local database /// mobile
                    // remote database  // online
                    TaskModel tas = TaskModel(
                        title: title,
                        description: description,
                        dateTime: DateUtils.dateOnly(selectedDate)
                            .microsecondsSinceEpoch);
                    //take datTime and return Date
                    showLoading(context, 'Loading...');

                    addTaskFromFireBase(tas).then((value) {
                      hideLoadingDialog(context);

                      showMessage(context, 'Added Successfully', 'Ok', () {
                        Navigator.popUntil(
                          context,
                              (route) => route.isFirst,
                        );
                        //to close any sheet at the top of base screen
                        // Navigator.pop(context);
                      });


                      // Navigator.pop(context);//close bottom sheet
                    }).catchError((e) {
                      hideLoadingDialog(context);
                    });
                  }
                },
                child: Text('Edit Task'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // return choosen date
  void OpenDatePicker() async {
    var choosenDate = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if (choosenDate != null) {
      selectedDate = choosenDate;
      setState(() {});
    }
  }
}
