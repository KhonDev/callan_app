import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testforfirebaseflutter/ui/screens/chat/chats.dart';
import 'package:testforfirebaseflutter/ui/screens/home/home_screen.dart';
import 'package:testforfirebaseflutter/ui/screens/social.dart';
import 'package:testforfirebaseflutter/ui/screens/home/home.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List list = [
    Home(profileId: currentUser!.id),
    Chats(),
    Social(),
  ];
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    _selectedIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list.elementAt(_selectedIndex),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: Colors.transparent,
        activeColor: Colors.blue,
        inactiveColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.house_siding_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.send), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.school_outlined), label: '')
        ],
      ),
      // GNav(
      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     tabBackgroundGradient:
      //         LinearGradient(colors: [Colors.grey, Colors.black]),
      //     onTabChange: _onItemTapped,
      //     hoverColor: Colors.amber.shade100,
      //     backgroundColor: Colors.transparent,
      //     gap: 40,
      //     padding: EdgeInsets.all(15),
      //     tabBorder: Border.all(color: Colors.grey, width: 2),
      //     curve: Curves.bounceIn,
      //     duration: Duration(milliseconds: 500),
      //     activeColor: Colors.white,
      //     iconSize: 18,
      //     tabs: [
      //       GButton(
      //         icon: Icons.home,
      //         text: 'Home',
      //       ),
      //       GButton(
      //         icon: Icons.send_rounded,
      //         text: 'Chats',
      //       ),
      //       GButton(
      //         icon: Icons.power_settings_new_outlined,
      //         text: 'Social',
      //       ),
      //     ]),
    );
  }
}
