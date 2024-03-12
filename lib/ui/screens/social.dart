import 'package:flutter/material.dart';
import 'package:testforfirebaseflutter/ui/screens/edite_profile.dart';

class Social extends StatelessWidget {
  const Social({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        children: [
          const Padding(
            padding: EdgeInsets.all(28.0),
            child: CircleAvatar(),
          ),
          const Padding(
            padding: EdgeInsets.all(28.0),
            child: CircleAvatar(),
          ),
          const Padding(
            padding: EdgeInsets.all(28.0),
            child: CircleAvatar(),
          ),
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const EditProfile(),
              ),
            ),
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
    );
  }
}
