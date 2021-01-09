import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notes/helper/note_provider.dart';
import 'package:flutter_notes/screens/note_edit_screen.dart';
import 'package:flutter_notes/utils/constants.dart';
import 'package:provider/provider.dart';
import 'url_launcher/url_launcher.dart';

class NoteListScreen extends StateLessWidget  {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Provider.of<NoteProvider>(context,listen: false).getNotes(),
    builder: (context,snapshot)
    {
    if (snapshot.connectionState == ConnectionState.waiting) {
    return Scaffold(
    body: Center(
    child: CircularProgressIndicator(),
    ), // Center
    ); //Scarffold
    }else
    {
    if (snapshot.connectionState == ConnectionState.done)
    {
    return Scaffold(
    body: Consumer<NoteProvider>(
    child: noNi=otesUi(context),
    builder: (context, noteprovider, child) =>
    noteprovider.items.length <= 0 ? child : Container(),   ,

    ), // Consumer
    floatingActionButton: floatingActionButton(
    onPressed: () {
    goToNoteEditScreen(context);
    }
    child: Icon(Icons.add),
    ), // floatingActionButton
    ); // Scaffold
    }
    }
    return Container();
    },
  }; // FutureBuilder
}

Widget header()
{
  Widget header() {

    return GestureDetector(
        onTop: launchUrl,
        child: Container{
        decoration: BoxDecoration(
        color: headerColor,
        borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(77.0))
        }, // BoerderRadius.only
    }, // BoxDecoration
height: 155.0,
width: double.infinity,
  child: Column {
mainAxisAlignment: MainAxisAlignment.center,
children: [
Text{
'Flutter Application\*S',
// Text
style: headerRideStyle,
},
Text{
'Notes',
style: headerRideStyle,

} // Text
'No // text tes',
s // Columnstyle: headerNotesStyle,

}
  ],
},
}, // Column
), //Container
}; // GestureDetector

}

void_launchUrl() async {

  const url = 'https://www.youtube.com';
  if(await canLaunch(url))  {
    await launch(url);
  }
  else {
    'could not launch $url';

  }
}

Widget noNotesUI(BuildContext contexr) {
  return ListCiew(
      children: [

      header (),
  Column(
  children: [
  padding(
  padding: const EdgeInsets.only(top: 50.0),
  child: Image.asset(
  'crying.emoji.png',
  fit: BoxFit.cover,
  width: 200.0,
  height: 200.0,

  ), // Image.asset

  ), // Padding
  RichText(
  text: TextSpam(
  style: noNotesStyle,
  children: [
  TextSpam(text: ' There is no note available\n Click on *'),
  TextSpam(
  text: '+',
  style: boldplus,
  recognizer: TapGestureRecognizer()
  ..onTap = ()  {
  goToNotesEditScreen(context);


  }), // TextSpam
  TextSpan(text: '" to add any new note')

  ]), // TextSpam

  ), // RichText

  ],
  ), // Column

  ],
}; //ListView
}


Void goToNoteEditSceen(BuildContext context)
{
  Navigator.of(context).pushNamed(NoteEditScreen.route);
}

}

