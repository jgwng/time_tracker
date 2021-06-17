import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:timetracker/service/notification/flutter_media_notification.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String status = 'hidden';

  @override
  void initState() {
    super.initState();

    MediaNotification.setListener('pause', () {
      setState(() => status = 'pause');
    });

    MediaNotification.setListener('play', () {
      setState(() => status = 'play');
    });

    MediaNotification.setListener('next', () {});

    MediaNotification.setListener('prev', () {});

    MediaNotification.setListener('select', () {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: const Text('Plugin example app'),
        ),
        body: new Center(
            child: Container(
              height: 250.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  TextButton(
                      child: Text('Show notification'),
                      onPressed: () {
                        MediaNotification.showNotification(
                            title: 'aaaa', author: 'Author');
                        setState(() => status = 'play');
                      }),
                  TextButton(
                      child: Text('Update notification'),
                      onPressed: () {
                        MediaNotification.showNotification(
                            title: 'New Title',
                            author: 'New Song author',
                            isPlaying: false);
                        setState(() => status = 'pause');
                      }),
                  TextButton(
                      child: Text('Hide notification'),
                      onPressed: () {
                        MediaNotification.hideNotification();
                        setState(() => status = 'hidden');
                      }),
                  Text('Status: ' + status)
                ],
              ),
            )),
      );
  }
}
