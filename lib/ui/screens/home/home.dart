import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:testforfirebaseflutter/domain/entity/user.dart';
import 'package:testforfirebaseflutter/ui/screens/home/home_screen.dart';
import 'package:testforfirebaseflutter/ui/screens/news_widget.dart';
import 'package:testforfirebaseflutter/ui/widgets/carousel_item.dart';
import 'package:testforfirebaseflutter/ui/widgets/global_tab.dart';
import 'package:testforfirebaseflutter/ui/widgets/home_tile.dart';

class Home extends StatefulWidget {
  final String profileId;

  const Home({super.key, required this.profileId});

  @override
  State<Home> createState() => _CallanState();
}

class _CallanState extends State<Home> {
  late Future<DocumentSnapshot<Map<String, dynamic>>> future;
  @override
  void initState() {
    super.initState();
    future = userDB.doc(currentUser!.id).get();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: future,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          User user = User.fromDocument(snapshot.data);
          return SafeArea(
            child: Column(
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          leading: CircleAvatar(),
                          title: Text(user.username),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            HomeTile(
                              title: 'Coin',
                              subTitle: 'Coming Soon',
                              leading: CircleAvatar(
                                backgroundColor: Colors.lightBlue,
                                child: Icon(
                                  Icons.wallet,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () {},
                            ),
                            const SizedBox(width: 20),
                            HomeTile(
                              title: '',
                              subTitle: 'Poinst ',
                              leading: CircleAvatar(
                                backgroundColor: Colors.orange,
                                child: Icon(
                                  Icons.star_outlined,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            HomeTile(
                              title: 'Students',
                              subTitle: 'Leaderboard',
                              leading: CircleAvatar(
                                backgroundColor: Colors.lightGreen,
                                child: Icon(
                                  Icons.leaderboard_rounded,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => GlobalTab(),
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            HomeTile(
                              title: 'News',
                              subTitle: 'Center',
                              leading: CircleAvatar(
                                backgroundColor: Colors.amber.shade900,
                                child: Icon(
                                  Icons.local_florist_rounded,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>NewScreen(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18.0),
                  child: CarouselSlider(
                    items: [
                      const CarouselItem(),
                      const CarouselItem(),
                    ],
                    options: CarouselOptions(
                        reverse: true,
                        enlargeCenterPage: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlay: true,
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 1000),
                        aspectRatio: 13 / 7),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
