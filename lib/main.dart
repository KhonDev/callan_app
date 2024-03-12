import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:testforfirebaseflutter/ui/screens/home/home_screen.dart';
import 'firebase_options.dart';

void main() async {
  runApp(const App());
// WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  HomeScreen(
      ),
    );
  }
}
