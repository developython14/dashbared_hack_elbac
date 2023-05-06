import 'package:dashboared_hakelbac/providers/stories/stories.dart';
import 'package:flutter/material.dart';
import 'package:dashboared_hakelbac/providers/stories/stories.dart';
import 'package:story_view/story_view.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:future_progress_dialog/future_progress_dialog.dart';
import 'package:mime/mime.dart';

class storybutton extends StatefulWidget {
  storybutton({
    this.title = '',
    this.cover_image = '',
    this.id = 0,
    Key? key,
  }) : super(key: key);
  String? title;
  String? cover_image;
  int? id;

  @override
  State<storybutton> createState() => _storybuttonState();
}

class _storybuttonState extends State<storybutton> {
  Future<void> remove_story(id) async {
    final url = Uri.parse('https://servicessaudi.de.r.appspot.com/post_pubs/');
    var request = http.MultipartRequest('POST', url);
    final headers = {'Content-type': 'multipart/form-data'};
    request.headers.addAll(headers);
    request.fields.addAll({'url': 'pub_link'});

    var push = await request.send();
    var response = await http.Response.fromStream(push);
    print(response.body);

    var jsonResponse = convert.jsonDecode(response.body);
  }

  Future<void> _dialogBuilder_remove_story(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Remove this story'),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text(
                'Confirm',
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () async {
                var id = context.read<Storiesproviderd>().removed_id_stories;
                await showDialog(
                  context: context,
                  builder: (context) => FutureProgressDialog(remove_story(id),
                      message: Text('Loading...')),
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.only(left: 15),
                padding: EdgeInsets.all(2),
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Color.fromARGB(255, 255, 17, 0), width: 4),
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.black,
                  image: DecorationImage(
                      image: NetworkImage(widget.cover_image.toString()),
                      fit: BoxFit.cover),
                  // button text
                )),
            Text(widget.title.toString()),
            IconButton(
                onPressed: () {
                  context.read<Storiesproviderd>().set_id_Stories(widget.id);
                  _dialogBuilder_remove_story(context);
                },
                icon: Icon(
                  Icons.remove_circle,
                  color: Colors.red,
                ))
          ],
        ),
        onTap: () {
          context.read<Storiesproviderd>().set_id_Stories(widget.id);
          Navigator.pushNamed(context, '/stories');
          ;
        });
  }
}

class MoreStories extends StatefulWidget {
  @override
  _MoreStoriesState createState() => _MoreStoriesState();
}

class _MoreStoriesState extends State<MoreStories> {
  final storyController = StoryController();

  @override
  void dispose() {
    storyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List ref = context.watch<Storiesproviderd>().selected_lis[0]['files'];
    for (var e in ref) {
      print('allo');
      print(lookupMimeType(e));
    }
    return Scaffold(
      body: StoryView(
        storyItems: ref
            .map(
              (e) => StoryItem.pageVideo(
                'https://storage.googleapis.com/bacdz/test.mp4',
                caption: "Still sampling",
                controller: storyController,
              ),
            )
            .toList(),
        onStoryShow: (s) {},
        onComplete: () {},
        progressPosition: ProgressPosition.top,
        repeat: false,
        controller: storyController,
      ),
    );
  }
}
