import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';
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
        body: OctoImage(
          image: CachedNetworkImageProvider(
              launch?.imagePatch ?? ""
          ),
          errorBuilder: OctoError.icon(color: Colors.red),
          fit: BoxFit.cover,
        )
        // body: Text(launch?.name ?? "")
    );
  }
}