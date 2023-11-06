import 'package:flutter/material.dart';

import 'streamer/data_getter.dart';

void main() async {
  runApp(const MyApp());
  // print(getData());
  // print(await getData());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 45, 51, 75)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(widget.title),
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: 'All'),
              Tab(text: 'New'),
              Tab(text: 'Trending'),
              Tab(text: 'Funny'),
              Tab(text: 'Drama'),
              Tab(text: 'Action'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Text('All'),
            Text('New'),
            Text('Trending'),
            Text('Funny'),
            Text('Drama'),
            Text('Action'),
          ],
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Play',
          child: const Icon(Icons.play_arrow),
        ),
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}

// class MyTabPannel extends StatefulWidget {
//   const MyTabPannel({super.key});

//   @override
//   State<MyTabPannel> createState() => _MyTabPannelState();
// }

// class _MyTabPannelState extends State<MyTabPannel> {
//   @override
//   Widget build(BuildContext context) {
//     return TabBar(tabs: List.filled(5, const Text('Tab')));
//   }
// }
