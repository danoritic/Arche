import 'package:arche/screen/screens.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<Map<String, dynamic>>? favoriteList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: true,
        // backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: (favoriteList?.isNotEmpty ?? false)
          ? Column(
              children: List.generate(
                  favoriteList?.length ?? 10,
                  (index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            // color: Colors.blue,
                            ),
                      )),
            )
          : const Center(child: EmptyScreen()),
    );
  }
}
