import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_notes/helper/note_provider.dart';
import 'package:flutter_notes/screens/note_edit_screen.dart';
import 'package:flutter_notes/screens/note_view_screen.dart';
import 'package:provider/provider.dart';
import '../utils/constants.dart';
class ListItem extends StatelessWidget {
  final int id;
  final String title;
  final String content;
  final String imagePath;
  final String date;
  ListItem({this.id, this.title, this.content, this.imagePath, this.date});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 138.0,
      margin: EdgeInsets.symmetric(horizontal: 13.0, vertical: 9.0),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, NoteViewScreen.route, arguments: id);
        },
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 13.0),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: shadow,
            borderRadius: BorderRadius.circular(14.0),
            border: Border.all(color: grey, width: 1.0),
          ),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: itemTitle,
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        date,
                        overflow: TextOverflow.ellipsis,
                        style: itemDateStyle,
                      ),
                      SizedBox(
                        height: 9.0,
                      ),
                      Expanded(
                        child: Text(
                          content,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: itemContentStyle,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if(imagePath!=null)
                Row(
                  children: [
                    SizedBox(
                      width: 13.0,
                    ),
                    Container(
                      width: 83.0,
                      height: 98.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13.0),
                        image: DecorationImage(
                          image: FileImage(
                            File(imagePath),
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}