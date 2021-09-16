import 'package:flutter/material.dart';
import '/src/api-client/launch.dart';
import '/src/api-client/api.dart';
import 'detail_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  build(context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SpaceX launches App',
        initialRoute: '/',
        routes: {
          '/': (context) => const MyListScreen(),
        },
        onGenerateRoute: (settings) {
          // If you push the PassArguments route
          if (settings.name == "/second") {
            final args = settings.arguments as int;
            return MaterialPageRoute(
              builder: (context) {
                return MyDetailScreen(launchId: args);
              },
            );
          }},
        theme: ThemeData(
          primarySwatch: Colors.grey,
        )
    );
  }
}

class MyListScreen extends StatefulWidget {
  const MyListScreen({Key? key}) : super(key: key);

  @override
  createState() => _MyListScreenState();
}

class _MyListScreenState extends State {
  var launches = List<Launch>.empty();

  _getLaunches() {
    API.fetchLaunches().then((response) {
      setState(() {
        launches = response;
      });
    });
  }

  @override
  initState() {
    super.initState();
    _getLaunches();
  }

  @override
  build(context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Launches List"),
        ),
        body: ListView.builder(
          itemCount: launches.length,
          itemBuilder: (context, index) {
            return ListTile(
                tileColor: _getTileColor(launches[index].imagePatch != null),
                title: Text(launches[index].name),
                onTap: () {Navigator.pushNamed(context, "/second", arguments: launches[index].flightNumber);}
                );
          },
        ));
  }

  Color _getTileColor(bool hasImage) {
    if(hasImage) {
      return Colors.amber;
    } else {
      return Colors.black;
    }
  }
}
