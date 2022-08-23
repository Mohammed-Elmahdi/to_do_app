import 'package:flutter/material.dart';
import 'package:to_do_new/models/task_model.dart';
import 'package:to_do_new/shared/components/components.dart';
import 'package:to_do_new/shared/styles/my_theme.dart';
import 'package:to_do_new/utils/add_task_firebase.dart';

class EditTask extends StatefulWidget {
  static const String routeName='Edit screen';
  @override
  State<EditTask> createState() => _EditTask();
}

class _EditTask extends State<EditTask> {
  late TaskModel editData;
  var selectedDate = DateTime.now();
  var formKey = GlobalKey<FormState>(); //textFormField
  TextEditingController title=TextEditingController();
  TextEditingController description=TextEditingController();


  @override
  Widget build(BuildContext context) {
    //get data from navigator
    editData = ModalRoute.of(context)!.settings.arguments as TaskModel;
    // selectedDate=DateTime.fromMicrosecondsSinceEpoch(editData.dateTime);
    title.text=editData.title;
    description.text=editData.description;


    return Stack(
      children:[
        Scaffold(
        appBar: AppBar(
          elevation: 5,
          title:  Text(
            'TO DO',
            style: Theme.of(context)
                .textTheme
                .headline1
                ?.copyWith(color: Colors.white,
            fontSize: 27
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      Column(
      children: [
        Expanded(
          flex: 8,
          child: Card(
            color: MyThemeData.WhiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
             margin: const EdgeInsets.only(top: 100,bottom: 40, left: 30, right: 25),


            child: Container(
              padding: EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Edit Task',
                    style: Theme.of(context)
                        .textTheme
                        .headline1
                        ?.copyWith(color: Colors.black,
                        fontSize: 27
                    ),
                    textAlign: TextAlign.center,
                  ),

                  //add new
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
                            editData.title = text;
                          },
                          controller: title,/////
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'Please enter task title';
                            }
                            return null;
                          },
                        ),
                        //title
                        SizedBox(height: 25,),
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
                            editData.description = text;
                          },
                          controller: description,
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
                  Spacer(
                    flex: 2,
                  ),
                  Text(
                    'Select Time',style:
                    TextStyle(
                      fontSize: 18
                    ),
                  ), //select time
                  Spacer(
                    flex: 1,
                  ),
                  InkWell(
                    onTap: () {
                      OpenDatePicker();
                    },
                    child: Text(
                      '${selectedDate.day} - ${selectedDate.month} - ${selectedDate.year}',
                      textAlign: TextAlign.center,
                    ),
                  ), //date
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        showLoading(context, 'Loading...');

                        updateTasksFromFirestore(editData).then((value) {
                          hideLoadingDialog(context);

                          showMessage(context, 'Edited Successfully', 'Ok', () {
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
                    child: Text('Save Change',
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                    ),
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(70, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),

                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
    ]
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
      editData.dateTime=choosenDate.microsecondsSinceEpoch;
      setState(() {});
    }
  }
}
