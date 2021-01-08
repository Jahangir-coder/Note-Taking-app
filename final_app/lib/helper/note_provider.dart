import 'package:flutter/material.dart';

class NoteProvider with ChangeNotifier{

  List _items = [];

  List get items {
    return [..._items];
  }
}