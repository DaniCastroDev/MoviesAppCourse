import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Movies App',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.red,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const snackBar = SnackBar(
      content: Text('Esto es una snackbar!'),
    );

    showSnackbar() {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('IMDB Movies App'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: showSnackbar,
              icon: const Icon(Icons.notifications_active),
            )
          ],
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Primera'),
              Tab(text: 'Segunda'),
            ],
          ),
        ),
        drawer: const Drawer(
          backgroundColor: Colors.red,
          child: Center(child: Text('Hola desde el drawer')),
        ),
        body: const TabBarView(children: [
          Center(child: Text('Primera')),
          Center(child: Text('Segunda')),
        ]),
      ),
    );
  }
}
