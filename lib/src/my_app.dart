import 'package:flutter/material.dart';
import '/src/api-client/launch.dart';
import '/src/api-client/api.dart';


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<List<Launch>> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = API.fetchLaunch();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SpaceX launches',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('SpaceX launches'),
        ),
        body: Center(
          child: FutureBuilder<List<Launch>>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data?.first.name ?? "empty");
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}