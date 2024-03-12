import 'dart:async';

import 'package:flutter/material.dart';
import 'package:testforfirebaseflutter/ui/screens/home/home_screen.dart';

class CreateUser extends StatefulWidget {
  const CreateUser({super.key});

  @override
  State<CreateUser> createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  final _formKey = GlobalKey<FormState>();
  String? userName;
final List<String> items = [
    'Ingliz tili',
    'Rus tili',
    'Arab tili',
    'Flutter',
    'Xattotlik',
    'Access',
    'Web daturlash',
  ];
  void submit() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      FocusScope.of(context).unfocus();
      form.save();
      SnackBar snackBar = SnackBar(
        content: Text('xush kelibsiz $userName'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Timer(
        const Duration(seconds: 2),
        () {
          ScaffoldMessenger.of(context).clearSnackBars();
          Navigator.pop(context, userName);
          Navigator.pop(context, userName);
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
            key: _formKey,
            child: TextFormField(
              onSaved: (newValue) => userName = newValue,
            ),
          ),
          DropdownButton(
             items: items
                        .map((String item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ))
                        .toList(),
                    value: groups,
                    onChanged: (String? value) {
                      setState(() {
                        groups = value;
                      });
                    },
          ),
          ElevatedButton(onPressed: submit, child: Text('Submit'))
        ],
      ),
    );
  }
}
