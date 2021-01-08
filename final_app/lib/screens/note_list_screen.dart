import 'package:flutter/material.dart';
import 'package:flutter/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class NoteListScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return FutureBuilder();
  }
  _launchUrl() async {
    const url = 'https://www.youtube.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  Widget header() {
    return GestureDetector(
      onTap: _launchUrl,
      child: Container(
        decoration: BoxDecoration(
          color: headerColor,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(75.0),
          ),
        ),
        height: 155,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Flutter App\'S',
              style: headerRideStyle,
            ),
            Text(
              'NOTES',
              style: headerNotesStyle,
            ),
          ],
        ),
      ),
    );
    Widget build(BuildContext context) {
      return FutureBuilder(
        future: Provider.of<NoteProvider>(context,listen: false).getNotes(),
        builder: (context,snapshot)
        {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          else
          {
            if(snapshot.connectionState == ConnectionState.done)
            {
              return Scaffold(
                body: Consumer<NoteProvider>(
                  child: noNotesUI(context),
                  builder: (context, noteprovider, child) =>
                  noteprovider.items.length <= 0
                      ? child
                      : Container(),
                ),
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    goToNoteEditScreen(context);
                  },
                  child: Icon(Icons.add),
                ),
              );
            }
            return Container(
              width: 0.0,
              height: 0.0,
            );
          }
        },
      );
    }
  }
}