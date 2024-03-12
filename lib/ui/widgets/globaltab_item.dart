import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:testforfirebaseflutter/ui/screens/home/home_screen.dart';

class GlobalTabItemWidget extends StatefulWidget {
  final String rank;
  final String reating;
  final String docID;

  const GlobalTabItemWidget(
      {super.key,
      required this.rank,
      required this.reating,
      required this.docID});

  @override
  State<GlobalTabItemWidget> createState() => _GlobalTabItemWidgetState();
}

class _GlobalTabItemWidgetState extends State<GlobalTabItemWidget> {
  int top = 0;
  void orin(int index) {
    top = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: userDB.doc(widget.docID).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;

          return Column(
            children: [
              SizedBox(height: 2),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey,
                  backgroundImage:
                      CachedNetworkImageProvider(currentUser!.photoUrl),
                ),
                title: RichText(
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                    style: const TextStyle(fontSize: 18.0, color: Colors.black),
                    children: [
                      TextSpan(
                        text: data['username'],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                subtitle: Row(
                  children: [
                    Text(
                      data['score'].toString(),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    const Text(
                      'point',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                trailing: Container(
                  width: 20.0,
                  height: 30.0,
                  child: Center(
                    child: Text(
                      widget.reating,
                      style:
                          const TextStyle(fontSize: 24.0, color: Colors.black),
                    ),
                  ),
                ),
              ),
            ],
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
