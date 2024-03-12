import 'dart:async';

import 'package:flutter/material.dart';

class CreateUser extends StatefulWidget {
  const CreateUser({super.key});

  @override
  State<CreateUser> createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
   final _formKey = GlobalKey<FormState>();
  String? userName;

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
        children: [
          Form(
            key: _formKey,
            child: TextFormField(
              onSaved: (newValue) => userName = newValue,
            ),
          ),
          ElevatedButton(onPressed: submit, child: Text('Submit'))
        ],
      ),
    );
  }
}
