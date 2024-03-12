import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Social extends StatelessWidget {
  const Social({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(28.0),
            child: CircleAvatar(),
          ),Padding(
            padding: const EdgeInsets.all(28.0),
            child: CircleAvatar(),
          ),Padding(
            padding: const EdgeInsets.all(28.0),
            child: CircleAvatar(),
          ),
        ],
      ),
    );
  }
}
