import 'package:flutter/material.dart';

class HomeTile extends StatelessWidget {
  final String title;
  final String subTitle;
  final Widget leading;
  VoidCallback onPressed;
  HomeTile(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.leading,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                color: Colors.white,
                offset: Offset(-6, -6),
                spreadRadius: 1,
                blurRadius: 15),
            BoxShadow(
                color: Colors.grey,
                offset: Offset(6, 6),
                spreadRadius: 1,
                blurRadius: 15),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        child: ListTile(
          dense: true,
          onTap: onPressed,
          leading: leading,
          title: Text(title),
          subtitle: Text(subTitle),
        ),
      ),
    );
  }
}
