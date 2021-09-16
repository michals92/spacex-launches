import 'package:flutter/material.dart';
import 'api-client/api.dart';
import 'api-client/launch.dart';

class MyDetailScreen extends StatefulWidget {
  const MyDetailScreen({Key? key, required this.launchId}) : super(key: key);

  final int launchId;

  @override
  createState() => _MyDetailScreenState();
}

class _MyDetailScreenState extends State<MyDetailScreen> {
  Launch? launch;

  _getLaunch() {
    API.fetchLaunchDetail(widget.launchId).then((response) {
      setState(() {
        launch = response;
      });
    });
  }

  @override
  initState() {
    super.initState();
    _getLaunch();
  }

  @override
  build(context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Detail"),
        ),
        body: Text(launch?.name ?? "")
    );
  }
}