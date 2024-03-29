class NoteModel {
  String title;
  String content;
  String date;
  String time;
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
