import 'package:flutter/material.dart';

import 'SearchTextField.dart';

Widget homeAppBar() {
  return Container(
    padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
    height: 235,
    width: double.infinity,
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: [0.1, 0.5],
        colors: [
          Color(0xFF463bce),
          Color(0xff5d54dd),
        ],
      ),
    ),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Hey User,",
                  style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Text(
                  " Let's Start Learning",
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
              ],
            ),
            IconButton(
                icon: const Icon(
                  Icons.notifications,
                  color: Colors.white,
                  size: 35,
                ),
                onPressed: () {}),
          ],
        ),
        const SizedBox(
          height: 24,
        ),
        const SizedBox(
          height: 30,
        ),
        SearchTextField(),
      ],
    ),
  );
}
