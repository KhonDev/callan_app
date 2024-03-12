import 'package:flutter/material.dart';
import 'package:testforfirebaseflutter/domain/entity/user.dart';
import 'package:testforfirebaseflutter/ui/screens/home/home_screen.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    getUser();
  }

  void getUser() async {
    final doc = await userDB.doc(currentUser!.id).get();
    final user = User.fromDocument(doc);
    controller.text = user.username;
  }

  void saveName() {
    final String name = controller.text;
    userDB.doc(currentUser!.id).update({'username': name});
    FocusScope.of(context).unfocus();
    controller.clear();
    Navigator.pop(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          CircleAvatar(
            radius: 60,
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: currentUser!.username,
              ),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: saveName,
            child: Text('Done'),
          ),
        ],
      ),
    );
  }
}
