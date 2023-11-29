import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          // backgroundColor: Colors.transparent,
          iconTheme: Theme.of(context).iconTheme.copyWith(
                weight: 100,
                size: 50,
              )),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset('assets/def.png'),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  Row(
                      children: List.filled(
                          5,
                          IconButton(
                              onPressed: () {}, icon: const Icon(Icons.star)))),
                  const Text(
                      'A badass movie you have selected there. Good choice'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VideoCard extends StatelessWidget {
  final Widget? image;
  final String? title;

  const VideoCard({super.key, this.image, this.title});

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
              child: Image.asset('assets/bg.jpeg', fit: BoxFit.fill),
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

class VideoCardWithTitle extends StatefulWidget {
  final Widget? image;
  final String? title;

  const VideoCardWithTitle({super.key, this.image, this.title});

  @override
  State<VideoCardWithTitle> createState() => _VideoCardWithTitleState();
}

class _VideoCardWithTitleState extends State<VideoCardWithTitle> {
  // final ScrollController _scrollController = ScrollController();
  bool continueScrollingCalled = false;
  double? customWidth = 135;
  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   customWidth = videoCardKey.currentContext?.size?.width;
    // });
    // // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    // //   print('WidgetsBinding calling');
    // //   _continueScrolling();
    // //   _scrollController.position.addListener(() {
    // //     scrollPosition = _scrollController.position.pixels;
    // //     print(_scrollController.position.pixels ==
    // //         _scrollController.position.maxScrollExtent);

    // //     if (_scrollController.position.pixels ==
    // //         _scrollController.position.maxScrollExtent) {
    // //       print('object');
    // //       print(_scrollController.position.pixels);
    // //       _scrollController.jumpTo(.1);
    // //       // scrollPosition = 0;
    // //       print(_scrollController.position.pixels);
    // //       print('listener calling');
    // //       _continueScrolling();
    // //     }
    // //   });
    // // });
    // WidgetsBinding.instance.waitUntilFirstFrameRasterized.then((value) {
    //   if (!continueScrollingCalled) {
    //     _continueScrolling();
    //     continueScrollingCalled = true;
    //   }
    // });
  }

  double scrollPosition = 0;

  // _continueScrolling() {
  //   count += 1;
  //   print('_continueScrolling $count');

  //   _scrollController
  //       .animateTo(_scrollController.position.maxScrollExtent,
  //           duration: const Duration(seconds: 10), curve: Curves.fastOutSlowIn)
  //       .then((value) {
  //     _scrollController.jumpTo(0);
  //   });
  // }

  @override
  void dispose() {
    // _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      // key: videoCardKey,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 0.0),
            child: SizedBox(
              height: 200,
              // width: 135,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: widget.image ??
                    Image.asset('assets/bg.jpeg', fit: BoxFit.fitHeight),
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
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              alignment: Alignment.center,
              // width: ,
              color: Theme.of(context).primaryColor.withAlpha(200),
              height: 20,
              width: 120,

              child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  // controller: () {
                  //   Future.delayed(
                  //     const Duration(milliseconds: 100),
                  //     () {
                  //       // print('rebulder calling');
                  //       // _continueScrolling();
                  //     },
                  //   );
                  //   return _scrollController;
                  // }.call(),
                  child: Text(
                    widget.title ?? 'orochimaro orochimaro orochimaro ',
                    overflow: TextOverflow.ellipsis,
                  )),
            ),
          ),
        ],
      ),
    );
    //overflow: TextOverflow.ellipsis, maxLines: 1
  }
}

GlobalKey<State<StatefulWidget>> videoCardKey = GlobalKey();

// ValueKey videoCardKey = const ValueKey<SizedBox>(SizedBox());
// const ValueKey<SizedBox>(SizedBox());
int count = 0;
