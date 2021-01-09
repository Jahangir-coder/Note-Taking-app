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
      height: 135.0,
      margin: EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, NoteViewScreen.route, arguments: id);
        },
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          decoration: BoxDecoration(
            color: Colors.white70,
            boxShadow: shadow,
            borderRadius: BorderRadius.circular(17.0),
            border: Border.all(color: Colors.blueGrey, width: 1.2),
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
                        height: 10.0,
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
                      width: 14.0,
                    ),
                    Container(
                      width: 85.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14.0),
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
