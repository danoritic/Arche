// import 'dart:js_interop';
import 'package:arche/handlers/handlers.dart';
import 'package:arche/theme_manager.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'common_widget.dart';
import 'screen/screens.dart';
import 'package:advanced_icon/advanced_icon.dart';
import 'package:arche/global_object.dart';
import 'package:arche/provider/theme_manager.dart';
import 'package:flutter/material.dart';

import 'package:card_swiper/card_swiper.dart';
import 'package:provider/provider.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'global_object.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
  // print(getData());
  // print(await getData());
}

int selectedIndex = 0;
ThemeMode? currentTheme;

List<Widget> bottomBarWidgetList = [
  const MyHomePage(title: 'Home'),
  const SearchScreen(),
  const FavoriteScreen(),
  const UserProfileScreen(),
];

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
  }

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
            darkTheme: ArcheTheme.dark(),
            theme: ArcheTheme.light(),
            themeMode: value.themeMode,
            home: Scaffold(
              extendBodyBehindAppBar: true,
              // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              bottomNavigationBar: BottomNavigationBar(
                  // backgroundColor: Colors.transparent,
                  onTap: (value) {
                    selectedIndex = value;
                    setState(() {});
                    Navigator.of(bottomNavKey.currentState!.context)
                        .push(MaterialPageRoute(
                      builder: (context) => bottomBarWidgetList[selectedIndex],
                    ));
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
              body: Navigator(
                key: bottomNavKey,
                onGenerateRoute: (settings) => MaterialPageRoute(
                  builder: (context) => bottomBarWidgetList[0],
                ),
              ),
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
  MovieListHandler movieListHandler = MovieListHandler();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: movieListHandler.getGenre(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            custom_print(snapshot.data, 'genre List');
            return DefaultTabController(
              length: snapshot.data!['genres'].length,
              child: Scaffold(
                extendBody: true,
                // backgroundColor: Theme.of(context).primaryColorDark,
                appBar: AppBar(
                  actions: [
                    IconButton(
                      onPressed: () {
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
                      },
                      icon: (context.read<ThemeModeManager>().themeMode ==
                              ThemeMode.light)
                          ? const Icon(Icons.dark_mode)
                              .animate()
                              .fadeIn(duration: const Duration(seconds: 1))
                          : const Icon(Icons.light_mode)
                              .animate()
                              .fadeIn(duration: const Duration(seconds: 1)),
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
                  bottom:
                      // getGenre
                      TabBar(
                    isScrollable: true,
                    tabs: List.generate(
                        snapshot.data!['genres'].length,
                        (index) => Tab(
                              text: snapshot.data!['genres'][index]['name'],
                            ))
                    // backgroundColor: Colors.transparent,

                    ,
                  ),
                  title: Text(widget.title),
                ),

                body: SizedBox(
                  height: MediaQuery.of(context).size.height * 8,
                  child: TabBarView(
                    children: List.generate(
                      snapshot.data!['genres'].length,
                      (index) => FutureBuilder(
                          future: movieListHandler.getMoviesByGenre(
                              snapshot.data!['genres'][index]['id'].toString()),
                          builder: (context, snapshot2) {
                            if (snapshot2.hasData) {
                              return MovieDisplayScreen(
                                  moviePlacad: () {
                                    List finalList = ((snapshot2
                                            .data!['results'])
                                        .where((element) =>
                                            element['backdrop_path'] != null)
                                        .toList());
                                    return finalList;
                                  }.call(),
                                  otherList: snapshot2.data!['results']);
                            } else {
                              return const Center(
                                child: CircularProgressIndicator.adaptive(),
                              );
                            }
                          }),
                    ),
                  ),
                ),

                // floatingActionButton: FloatingActionButton(
                //   onPressed: _incrementCounter,
                //   tooltip: 'Play',
                //   child: const Icon(Icons.play_arrow),
                // ),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
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
              const SizedBox(
                height: 20,
              ),
              Center(
                child: SizedBox(
                  height: 200,
                  width: 350,
                  child: Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:
                            //  VideoCard(),
                            ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            "assets/bdPoster.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                    itemCount: 3,
                    pagination: const SwiperPagination(
                      builder: DotSwiperPaginationBuilder(
                          // activeColor:
                          //     Theme.of(context).colorScheme.primaryContainer,
                          // color: Theme.of(context).colorScheme.inverseSurface
                          ),
                      margin: EdgeInsets.only(top: 19),
                    ),
                    // control: const SwiperControl(),
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
