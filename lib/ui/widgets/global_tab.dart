import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:testforfirebaseflutter/ui/screens/home/home_screen.dart';
import 'package:testforfirebaseflutter/ui/widgets/globaltab_item.dart';

class GlobalTab extends StatefulWidget {
  const GlobalTab({
    super.key,
  });

  @override
  State<GlobalTab> createState() => _GlobalTabState();
}

class _GlobalTabState extends State<GlobalTab> {
  late final Future? _future;
  final currentRank = currentUser?.score;

  List<String> highScore = [];
  List top10 = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'];

  @override
  void initState() {
    _future = getActivityuser();
    super.initState();
  }

  Future getActivityuser() async {
    await FirebaseFirestore.instance
        .collection('users')
        .orderBy('score', descending: true)
        .limit(10)
        .get()
        .then(
          (value) => value.docs.forEach(
            (element) {
              highScore.add(element.reference.id);
            },
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(
            'assets/scren.jpg',
          ),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 30,
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.transparent,
        body: FutureBuilder(
          future: _future,
          builder: (context, AsyncSnapshot snapshot) {
            return ListView.builder(
              itemCount: highScore.length,
              itemBuilder: (context, index) => GlobalTabItemWidget(
                docID: highScore[index],
                rank: currentRank!.toString(),
                reating: top10[index],
              ),
            );
          },
        ),
      ),
    );
  }
}
