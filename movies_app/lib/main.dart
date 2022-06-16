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
        backgroundColor: Colors.grey[200],
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
          Center(child: MovieCard()),
          // Center(child: Text('Primera')),
          Center(child: Text('Segunda')),
        ]),
      ),
    );
  }
}

class MovieCard extends StatelessWidget {
  const MovieCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Card(
        elevation: 0,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  clipBehavior: Clip.hardEdge,
                  child: Image.network(
                    'https://m.media-amazon.com/images/I/91Tr+bhnMUL._AC_SL1500_.jpg',
                    fit: BoxFit.fill,
                  )),
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      'Spider-Man: Into the Spider-Verse',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('1h 57m'),
                      Row(
                        children: [
                          const Text('8,4'),
                          Icon(Icons.star, color: Colors.yellow[700], size: 18),
                        ],
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
