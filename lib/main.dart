// import 'dart:js_interop';

import 'package:advanced_icon/advanced_icon.dart';
import 'package:arche/global_object.dart';
import 'package:arche/provider/theme_manager.dart';
import 'package:flutter/material.dart';

import 'package:card_swiper/card_swiper.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(const MyApp());
  // print(getData());
  // print(await getData());
}

int selectedIndex = 1;
ThemeMode? currentTheme;
List<Widget> bottomBarWidgetList = [
  const MyHomePage(title: 'title'),
  const TestWidget(),
  Container(
    color: const Color.fromARGB(255, 218, 156, 152),
  ),
  Container(
    color: Colors.green,
  ),
];

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeModeManager(),
        ),
      ],
      child: Consumer<ThemeModeManager>(
        builder: (BuildContext context, value, Widget? child) {
          return MaterialApp(
            navigatorKey: mainNavKey,
            debugShowCheckedModeBanner: false,
            title: 'Arche',
            darkTheme: ThemeData(
              dividerColor: Colors.amber,
              brightness: Brightness.dark,

              colorSchemeSeed: const Color.fromARGB(255, 21, 16, 44),
              scaffoldBackgroundColor: const Color.fromARGB(255, 37, 25, 58),
              indicatorColor: const Color.fromARGB(255, 206, 204, 211),
              bottomAppBarTheme: const BottomAppBarTheme(
                  color: Color.fromARGB(255, 206, 204, 211)),
              // colorScheme:
              //     ColorScheme.fromSeed(seedColor: Colors.deepPurple[900]!),
              useMaterial3: true,
            ),
            theme: ThemeData(
              // primaryColor: const Color.fromARGB(255, 209, 214, 231),
              // // scaffoldBackgroundColor: const Color.fromARGB(255, 209, 214, 231),
              // indicatorColor: const Color.fromARGB(255, 0, 13, 22),
              brightness: Brightness.light,
              colorSchemeSeed: const Color.fromARGB(255, 132, 126, 142),
              // colorSchemeSeed: const Color.fromARGB(255, 21, 16, 44),
              scaffoldBackgroundColor: const Color.fromARGB(255, 206, 204, 211),
              indicatorColor: const Color.fromARGB(255, 206, 204, 211),
              bottomAppBarTheme: const BottomAppBarTheme(
                  color: Color.fromARGB(255, 206, 204, 211)),
              // colorScheme:
              //     ColorScheme.fromSeed(seedColor:),
              useMaterial3: true,
            ),
            themeMode: value.themeMode,
            home: Scaffold(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              bottomNavigationBar: BottomNavigationBar(
                  onTap: (value) {
                    selectedIndex = value;
                    setState(() {});
                  },
                  currentIndex: selectedIndex,
                  type: BottomNavigationBarType.fixed,
                  // backgroundColor: Theme.of(context).primaryColor.withAlpha(40),
                  elevation: 0,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  items: const [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.home_filled), label: 'one'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.search_rounded), label: ''),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.favorite), label: ''),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.account_circle_rounded), label: ''),
                  ]),
              body: bottomBarWidgetList[selectedIndex],
            ),
          );
        },
      ),
    );
  }
}

class TestWidget extends StatefulWidget {
  const TestWidget({super.key});

  @override
  State<TestWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 400,
        width: 350,
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return const Padding(
              padding: EdgeInsets.all(8.0),
              child: VideoCard(),
              // ClipRRect(
              //   borderRadius: BorderRadius.circular(20),
              //   child: Image.asset(
              //     "assets/def.png",
              //     fit: BoxFit.contain,
              //   ),
              // ),
            );
          },
          itemCount: 3,
          pagination: const SwiperPagination(),
          control: const SwiperControl(),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

AdvancedIconState _state = AdvancedIconState.secondary;

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _changeState() {
    setState(() {
      !(_state == AdvancedIconState.secondary)
          ? _state = AdvancedIconState.secondary
          : _state == AdvancedIconState.primary;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        // backgroundColor: Theme.of(context).primaryColorDark,
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                _changeState();
                print('gonna set state');
                (!(context.read<ThemeModeManager>().themeMode ==
                        ThemeMode.light))
                    ? context
                        .read<ThemeModeManager>()
                        .changeTheme(ThemeMode.light)
                    : context
                        .read<ThemeModeManager>()
                        .changeTheme(ThemeMode.dark);
                setState(() {});
                print(' set state dark $currentTheme');
                _changeState();
              },
              icon: AdvancedIcon(
                  // effect: AdvancedIconEffect.bubble,
                  icon: Icons.dark_mode,
                  state: _state,
                  secondaryIcon: Icons.light_mode),
            )

            // IconButton(
            //     onPressed: () {
            //       print('gonna set state');
            //       currentTheme = ThemeMode.dark;
            //       setState(() {});
            //       print(' set state light $currentTheme');
            //     },
            //     icon: (const Icon(Icons.dark_mode)))
          ],
          bottom: const TabBar(isScrollable: true, tabs: [
            Tab(
              text: 'All',
            ),
            Tab(
              text: 'New',
            ),
            Tab(
              text: 'Trending',
            ),
            Tab(
              text: 'Funny',
            ),
            Tab(
              text: 'Drama',
            ),
            Tab(
              text: 'Action',
            ),
          ]),
          backgroundColor: Colors.transparent,
          title: Text(widget.title),
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height * 8,
          child: const TabBarView(
            children: [
              FirstPage(),
              VideoDetailPage(),
              Center(child: Text('Trending', style: TextStyle(fontSize: 70))),
              Center(child: Text('Trending', style: TextStyle(fontSize: 70))),
              Center(child: Text('Funny', style: TextStyle(fontSize: 70))),
              Center(child: Text('Drama', style: TextStyle(fontSize: 70))),
              // Center(child: Text('Action', style: TextStyle(fontSize: 70))),
            ],
          ),
        ),

        // floatingActionButton: FloatingActionButton(
        //   onPressed: _incrementCounter,
        //   tooltip: 'Play',
        //   child: const Icon(Icons.play_arrow),
        // ),
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
class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: SizedBox(
                  height: 200,
                  width: 350,
                  child: Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      return const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: VideoCard(),
                        // ClipRRect(
                        //   borderRadius: BorderRadius.circular(20),
                        //   child: Image.asset(
                        //     "assets/def.png",
                        //     fit: BoxFit.contain,
                        //   ),
                        // ),
                      );
                    },
                    itemCount: 3,
                    pagination: const SwiperPagination(),
                    control: const SwiperControl(),
                  ),
                ),
              ),

              // SizedBox(height: MediaQuery.of(context).size.height * .3),
              SizedBox(
                height: 300,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: VideoCard(),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class VideoDetailPage extends StatefulWidget {
  final Map<String, dynamic>? videoDetail;
  const VideoDetailPage({super.key, this.videoDetail});

  @override
  State<VideoDetailPage> createState() => _VideoDetailPageState();
}

class _VideoDetailPageState extends State<VideoDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset('assets/def.png'),
            ),
            Row(
                children: List.filled(
                    5,
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.star)))),
            const Text('A badass movie you have selected there. Good choice'),
          ],
        ),
      ),
    );
  }
}

class VideoCard extends StatelessWidget {
  const VideoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 0.0),
          child: SizedBox(
            height: 200,
            width: 135,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset('assets/def.png', fit: BoxFit.fill),
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: CircleAvatar(
            minRadius: 0,
            maxRadius: 25,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const VideoDetailPage(),
                ));
              },
              icon: const Icon(Icons.play_arrow),
            ),
          ),
        )
      ],
    );
  }
}
