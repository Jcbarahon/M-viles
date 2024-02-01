import 'package:flutter/material.dart';

class HomeBottomBar extends StatelessWidget {
  const HomeBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 8,
          ),
        ],
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.home,
            color: Color(0xFFC67C4E),
            size: 35,
          ),
          Icon(
            Icons.favorite_outlined,
            color: Colors.black,
            size: 35,
          ),
          Icon(
            Icons.notifications,
            color: Colors.black,
            size: 35,
          ),
          Icon(
            Icons.person,
            color: Colors.black,
            size: 35,
          )
        ],
      ),
    );
  }
}
