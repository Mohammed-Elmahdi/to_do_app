import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:to_do_new/models/task_model.dart';

//to create :
//collection = class  && document = object
//convert from json to task model then from model to json
// FirebaseFirestore.instance;
//1-Function to create collection
CollectionReference<TaskModel> getTaskFromFireStore() {
  return FirebaseFirestore.instance.collection('task').withConverter<TaskModel>(
      fromFirestore: (snapshot, op) {
        //return model
        return TaskModel.fromJson(snapshot.data()!);
      },
      toFirestore: (task, option) => task.toJson());
}

//class
//2-create documents
Future<void> addTaskFromFireBase(TaskModel task) {
  var TypeCollection = getTaskFromFireStore();
  var doc = TypeCollection.doc();
  task.id = doc.id; //auto create
  return doc.set(task);
}

//3-get Tsk
Future<QuerySnapshot<TaskModel>> getTaskFromFirebase(DateTime dateTime) {
  var tasks = getTaskFromFireStore();
  return tasks
      .where('date',
          isEqualTo: DateUtils.dateOnly(dateTime).microsecondsSinceEpoch)
      .get();
}

// to rebuild any changes immediately on all screens
Stream<QuerySnapshot<TaskModel>> getTaskFromFirebaseUsingStream(
    DateTime dateTime) {
  var tasks = getTaskFromFireStore();
  return tasks
      .where('date',
          isEqualTo: DateUtils.dateOnly(dateTime).microsecondsSinceEpoch)
      .snapshots();
}

//to delete taskItem
Future<void> deleteTaskFromFireStore(TaskModel task) {
  return getTaskFromFireStore().doc(task.id).delete();
}
