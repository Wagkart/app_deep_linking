import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';

class VideoPlayer extends StatefulWidget {
  final VideoController controller;
  final String url;
  const VideoPlayer(this.controller, this.url, {super.key});

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  @override
  void initState() {
    if (widget.controller.player.state.playlist.medias.length == 0)
      widget.controller.player.open(Media(widget.url), play: true);
    else
      widget.controller.player.play();

    super.initState();
  }

  @override
  void dispose() {
    widget.controller.player.pause();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Video Player')),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width * 9.0 / 16.0,
          // Use [Video] widget to display video output.
          child: Video(
            width: 300,
            height: 400,
            controller: widget.controller,
            fit: BoxFit.cover,
            filterQuality: FilterQuality.medium,
          ),
        ),
      ),
    );
  }
}
