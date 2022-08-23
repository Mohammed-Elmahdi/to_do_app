import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//instead of streamer to get data from fireBase in task tab

class TasksProvider extends ChangeNotifier {
   void refreshTAsks(){
     notifyListeners();
   }


}
