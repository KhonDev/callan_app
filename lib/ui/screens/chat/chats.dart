import 'package:flutter/material.dart';
import 'package:testforfirebaseflutter/ui/screens/chat/dasturlash.dart';
import 'package:testforfirebaseflutter/ui/screens/chat/english.dart';

class Chats extends StatelessWidget {
  Chats({super.key});
  List chatList = [
    Dasturlash(),
    English(),
    Text('data'),
    Text('data'),
    Text('data'),
  ];
  List titleList = [
    'Dasturlash',
    'English',
    'data',
    'data',
    'data',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: List.generate(
            5,
            (index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(3, 5),
                    ),
                  ],
                ),
                child: Center(
                  child: ListTile(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => chatList[index],
                      ),
                    ),
                    leading: CircleAvatar(),
                    title: Text(
                      titleList[index].toString(),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
