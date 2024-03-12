
import 'package:flutter/material.dart';

class CarouselItem extends StatelessWidget {
  const CarouselItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25.0),
      child: Container(
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage('assets/scren.jpg'),
            fit: BoxFit.fill,
          ),
          boxShadow: const [
            BoxShadow(
                color: Colors.grey,
                offset: Offset(-6, -6),
                spreadRadius: -5,
                blurRadius: 15),
            BoxShadow(
                color: Colors.grey,
                offset: Offset(6.0, 6.0),
                spreadRadius: 1,
                blurRadius: 15),
          ],
          borderRadius: BorderRadius.circular(20),
          color: Colors.red,
        ),
      ),
    );
  }
}
