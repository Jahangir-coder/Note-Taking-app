import 'package:flutter/material.dart';
import 'package:flutter_notes/helper/database_helper.dart';
import '../models/note.dart';

class NoteProvider with ChangeNotifier {
  List _items = [];

  List get items {
    return [..._items];
  }

  Future getNotes() async {
    final notesList = await DatabaseHelper.getNotesFromDB();

    _items = notesList
        .map(
          (item) =>
          Note(
              item['id'], item['title'], item['content'], item['imagePath']),
    )
    {
      Consumer(
        child: noNotesUI(context),
        builder: (context, noteprovider, child) =>
        noteprovider.items.length <= 0
            ? child
            : ListView.builder(
          itemCount: noteprovider.items.length + 1,
          itemBuilder: (context, index)
          {
            if (index == 0)
            {
              return header();
            }

            else
            {
              final i = index - 1;
              final item = noteprovider.items[i];
              return ListItem(
                id: item.id,
                title: item.title,
                content: item.content,
                imagePath: item.imagePath,
                date: item.date,
              );
            }
          },
        ),
      ),
    },
        .toList();

    notifyListeners();
  }
}