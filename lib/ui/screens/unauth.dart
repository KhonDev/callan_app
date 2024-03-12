import 'package:flutter/material.dart';

class unAuth extends StatelessWidget {
  
  final VoidCallback onTap;
  const unAuth({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
          ),
          Text('Callan'),
          ElevatedButton(
            onPressed: onTap,
            child: Text('sing In'),
          ),
        ],
      ),
    );
  }
}
