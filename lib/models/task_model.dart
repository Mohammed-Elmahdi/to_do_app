class TaskModel {
  String id;
  String title;
  String description;
  int dateTime;
  bool isDone;

  TaskModel({
    this.id = '',
    required this.title,
    required this.description,
    required this.dateTime,
    this.isDone = false,
  });

  //firebase understand mab toJson =>function
  //me understand taskModel  fromJson =>constructor
//Java Script Object Notation  return {object} or [list]

  TaskModel.fromJson(Map<String, dynamic> json) //named constructor
      : this(
            id: json['id'] as String,
            title: json['title'] as String,
            description: json['description'] as String,
            dateTime: json['date'] as int,
            isDone: json['isDone'] as bool);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date': dateTime,
      'isDone': isDone
    };
  }
}
