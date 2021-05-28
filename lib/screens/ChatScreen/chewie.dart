import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';

class ChewieDemo extends StatefulWidget {
  const ChewieDemo({
    Key key,
    this.title = 'Chewie Demo',
  }) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() {
    return _ChewieDemoState();
  }
}

class _ChewieDemoState extends State<ChewieDemo> {
  VideoPlayerController _videoPlayerController1;

  ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  @override
  void dispose() {
    _videoPlayerController1.dispose();

    _chewieController?.dispose();
    super.dispose();
  }

  Future<void> initializePlayer() async {
    _videoPlayerController1 =
        VideoPlayerController.network('http://scaptor.com/bkdschool/video.mp4');

    await Future.wait([
      _videoPlayerController1.initialize(),
    ]);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController1,
      autoPlay: true,
      looping: true,

      // Try playing around with some of these other options:

      // showControls: false,
      // materialProgressColors: ChewieProgressColors(
      //   playedColor: Colors.red,
      //   handleColor: Colors.blue,
      //   backgroundColor: Colors.grey,
      //   bufferedColor: Colors.lightGreen,
      // ),
      // placeholder: Container(
      //   color: Colors.grey,
      // ),
      // autoInitialize: true,
    );
    setState(() {});
  }

  String albumName = 'Media';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: widget.title,
        home: Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
            ),
            body: Column(children: <Widget>[
              Expanded(
                child: Center(
                  child: _chewieController != null &&
                          _chewieController
                              .videoPlayerController.value.isInitialized
                      ? Chewie(
                          controller: _chewieController,
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            CircularProgressIndicator(),
                            SizedBox(height: 20),
                            Text('Loading'),
                          ],
                        ),
                ),
              ),
              TextButton(
                onPressed: _saveNetworkVideo,
                child: const Text('Save'),
              ),
            ])));
  }

  void _saveNetworkVideo() async {
    String path = 'http://scaptor.com/bkdschool/video.mp4';
    GallerySaver.saveVideo(path, albumName: albumName).then((bool success) {
      setState(() {
        print('Video is saved');
      });
    });
  }
}
