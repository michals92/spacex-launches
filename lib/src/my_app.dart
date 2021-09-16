import 'package:flutter/material.dart';
import '/src/api-client/launch.dart';
import '/src/api-client/api.dart';


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SpaceX launches App',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: MyListScreen(),
    );
  }
}

class MyListScreen extends StatefulWidget {
  @override
  createState() => _MyListScreenState();
}

class _MyListScreenState extends State {
  var launches = List<Launch>.empty();

  _getLaunches() {
    API.fetchLaunch().then((response) {
      setState(() {
        launches = response;
      });
    });
  }

  initState() {
    super.initState();
    _getLaunches();
  }

  dispose() {
    super.dispose();
  }

  @override
  build(context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Launches List"),
        ),
        body: ListView.builder(
          itemCount: launches.length,
          itemBuilder: (context, index) {
            return ListTile(title: Text(launches[index].name));
          },
        ));
  }
}
