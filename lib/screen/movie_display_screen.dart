import 'dart:ui';

import 'package:arche/global_object.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import '../common_widget.dart';

class MovieDisplayScreen extends StatefulWidget {
  final List moviePlacad;
  final List otherList;

  const MovieDisplayScreen({
    super.key,
    required this.moviePlacad,
    required this.otherList,
  });

  @override
  State<MovieDisplayScreen> createState() => _MovieDisplayScreenState();
}

class _MovieDisplayScreenState extends State<MovieDisplayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height * 8,
        child: SingleChildScrollView(
          child: Column(
              children: <Widget>[
                    SizedBox(
                      height: 250,
                      child: Swiper(
                        itemBuilder: (BuildContext context, int index) {
                          // List subList = widget.;

                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:
                                //  VideoCard(),
                                ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                imageBaseUrl +
                                    widget.moviePlacad[index]['poster_path'],
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
                  ] +
                  [
                    const SizedBox(
                      height: 10,
                    )
                  ] +
                  [
                    SizedBox(
                      height: 300,
                      child: ListView.builder(
                        itemCount: widget.otherList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: VideoCardWithTitle(
                              image: CachedNetworkImage(
                                imageUrl: imageBaseUrl +
                                    widget.otherList[index]['poster_path'],
                                placeholder: (context, url) => BackdropFilter(
                                  filter:
                                      ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                  child: Container(
                                    width: 120,
                                    height: 300,
                                    color: Theme.of(context).primaryColorLight,
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                              // Image.network(
                              //   imageBaseUrl +
                              //       widget.otherList[index]['poster_path'],
                              //   fit: BoxFit.cover,
                              // ),
                              title: widget.otherList[index]['title'],
                            ),
                          );
                        },
                      ),
                    ),
                  ]),
        ),
      ),
    );
  }
}
