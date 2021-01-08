import 'package:flutter/material.dart';

class NoteViewScreen extends StatefulWidget {
  static const route = '/note-view';
  @override
  _NoteViewScreenState createState() => _NoteViewScreenState();
}
class _NoteViewScreenState extends State {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        elevation: 0.7,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.delete,
              color: Colors.black,
            ),
            onPressed: () => _showDialog(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                selectedNote?.title,
                style: viewTitleStyle,
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.access_time,
                    size: 20,
                  ),
                ),
                Text('${selectedNote?.date}')
              ],
            ),
            if (selectedNote.imagePath != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Image.file(File(selectedNote.imagePath)),
              ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                selectedNote.content,
                style: viewContentStyle,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, NoteEditScreen.route,
              arguments: selectedNote.id);
        },
        child: Icon(Icons.edit),
      ),
    );
  }
  _showDialog() {
    showDialog(
        context: this.context,
        builder: (context) {
          return DeletePopUp(selectedNote: selectedNote);
        });
  }
}
}
class _NoteViewScreenState extends State {
  Note selectedNote;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final id = ModalRoute.of(context).settings.arguments;
    final provider = Provider.of<NoteProvider>(context);
    if (provider.getNote(id) != null) {
      selectedNote = provider.getNote(id);
    }
  }
}