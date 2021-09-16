

import 'package:flutter/material.dart';

import 'api.dart';
import 'launch.dart';

class MyDetailScreen extends StatefulWidget {
  const MyDetailScreen({Key? key}) : super(key: key);

  @override
  createState() => _MyDetailScreenState();
}

class _MyDetailScreenState extends State {
  Launch? launch;
  late int launchId = 0;

  _getLaunch() {
    API.fetchLaunchDetail(launchId).then((response) {
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

    launchId = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
        appBar: AppBar(
          title: const Text("Launches List"),
        ),
        body: Text(launch?.name ?? "")
    );
  }
}