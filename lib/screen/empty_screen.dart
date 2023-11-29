import 'package:flutter/material.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 100,
            width: 150,
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(20)),
            alignment: Alignment.center,
            child: const Icon(
              Icons.play_arrow_rounded,
              size: 100,
            ),
          ),
          const Text('Empty')
        ],
      ),
    );
  }
}
