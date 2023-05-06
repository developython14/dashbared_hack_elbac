import 'package:dashboared_hakelbac/providers/stories/stories.dart';
import 'package:flutter/material.dart';
import 'package:dashboared_hakelbac/providers/stories/stories.dart';
import 'package:story_view/story_view.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';

class storybutton extends StatelessWidget {
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
                      image: NetworkImage(cover_image.toString()),
                      fit: BoxFit.cover),
                  // button text
                )),
            Text(title.toString())
          ],
        ),
        onTap: () {
          context.read<Storiesproviderd>().set_id_Stories(id);
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
    List ref = context
        .watch<Storiesproviderd>()
        .list_stories[context.watch<Storiesproviderd>().id]['files'];
    return Scaffold(
      body: StoryView(
        storyItems: ref
            .map(
              (e) => StoryItem.pageVideo(
                'https://assets.mixkit.co/videos/preview/mixkit-man-looks-for-a-tennis-ball-in-supermarket-49356-large.mp4',
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
