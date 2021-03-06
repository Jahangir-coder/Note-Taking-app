import 'package:intl/intl.dart';

class Note {
  int _id;
  String _title;
  String _content;
  String _imagePath;

  Note(this._id, this._title, this._content, this._imagePath);

  int get id => _id;
  String get title => _title;
  String get content => _content;
  String get imagePath => _imagePath;

  String get date {
    final date = DateTime.fromMillisecondsSinceEpoch(id);
    return DateFormat('EEE h:mm a, dd/MM/yyyy').format(date);
  }
  {
  void saveNote() {
    String title = titleController.text.trim();
    String content = contentController.text.trim();
    String imagePath = _image != null ? _image.path : null;

    int id = DateTime
        .now()
        .millisecondsSinceEpoch;
    Provider.of<NoteProvider>(this.context, listen: false)
        .addOrUpdateNote(id, title, content, imagePath, EditMode.ADD);
    Navigator.of(this.context)
        .pushReplacementNamed(NoteViewScreen.route, arguments: id);
  }
},


}