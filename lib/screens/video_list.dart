import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:video_player/screens/video_player.dart';

class VideoList extends StatefulWidget {
  final int itemCount;
  const VideoList(this.itemCount, {super.key});

  @override
  State<VideoList> createState() => _VideoListState();
}

class _VideoListState extends State<VideoList> {
  List<String> urls = [
    'https://user-images.githubusercontent.com/28951144/229373695-22f88f13-d18f-4288-9bf1-c3e078d83722.mp4',
    'https://user-images.githubusercontent.com/28951144/229373709-603a7a89-2105-4e1b-a5a5-a6c3567c9a59.mp4',
    'https://user-images.githubusercontent.com/28951144/229373716-76da0a4e-225a-44e4-9ee7-3e9006dbc3e3.mp4',
    'https://user-images.githubusercontent.com/28951144/229373718-86ce5e1d-d195-45d5-baa6-ef94041d0b90.mp4',
    'https://user-images.githubusercontent.com/28951144/229373720-14d69157-1a56-4a78-a2f4-d7a134d7c3e9.mp4'
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of Videos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: (widget.itemCount != 0)
            ? ListView.builder(
                itemCount: (widget.itemCount / 2)
                    .ceil(), // Calculate rows based on 2 items per row
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: List.generate(
                        (index + 1) * 2 > widget.itemCount
                            ? widget.itemCount % 2
                            : 2,
                        (innerIndex) {
                          return VideoTile(
                            urls[(index + innerIndex % 5)],
                            key: Key('{$index}${innerIndex}'),
                          );
                        },
                      ),
                    ),
                  );
                },
              )
            : Text(
                'Number of Item is 0',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
      ),
    );
  }
}

class VideoTile extends StatefulWidget {
  final String url;
  const VideoTile(this.url, {super.key});

  @override
  State<VideoTile> createState() => _VideoTileState();
}

class _VideoTileState extends State<VideoTile> {
// Create a [Player] to control playback.
  late final Player player;
  // Create a [VideoController] to handle video output from [Player].
  late final controller = VideoController(player);

  @override
  void initState() {
    super.initState();
    player = Player();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          Get.to(VideoPlayer(
            controller,
            widget.url,
            key: Key(widget.url),
          ));
        },
        child: Card(
          elevation: 4,
          child: Container(
            color: Colors.grey[300],
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Icon(
                Icons.video_library,
                size: 36,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
