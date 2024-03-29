import 'package:hive/hive.dart';

part 'notes_model.g.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String content;
  @HiveField(2)
  String date;
  @HiveField(3)
  String time;
  @HiveField(4)
  String id;

  NoteModel(
      {required this.title,
      required this.content,
      required this.date,
      required this.time,
      required this.id});

  
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'content': content,
      'date': date,
      'time': time,
      'id': id
    };
  }
  

  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
        title: map['title'],
        content: map['content'],
        date: map['date'],
        time: map['time'],
        id: map['id']);
  }
}
