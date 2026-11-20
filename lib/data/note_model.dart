// the data model for one note
class Note {
  final int? id;
  final String title;
  final String description;

  Note({this.id, required this.title, required this.description});

  // convert a Note object into a Map, object properties must match the db column names
  Map<String, dynamic> toMap() {
    return {
      if (id != null) 'id': id,
      'title': title,
      'description': description,
    };
  }

  // convert a Map (from the database) into a Note object
  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'],
      title: map['title'],
      description: map['description'],
    );
  }
}