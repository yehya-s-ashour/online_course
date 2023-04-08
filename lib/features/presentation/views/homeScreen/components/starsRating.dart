import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class starsRating extends StatelessWidget {
  const starsRating({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    int rating = 3;
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            size: 12.spMin,
            Icons.star,
            color:
                rating >= 1 ? Color.fromARGB(255, 240, 179, 88) : Colors.grey,
          ),
          Icon(
            size: 12.spMin,
            Icons.star,
            color:
                rating >= 2 ? Color.fromARGB(255, 240, 179, 88) : Colors.grey,
          ),
          Icon(
            size: 12.spMin,
            Icons.star,
            color:
                rating >= 3 ? Color.fromARGB(255, 240, 179, 88) : Colors.grey,
          ),
          Icon(
            size: 12.spMin,
            Icons.star,
            color:
                rating >= 4 ? Color.fromARGB(255, 240, 179, 88) : Colors.grey,
          ),
          Icon(
            size: 12.spMin,
            Icons.star,
            color:
                rating >= 5 ? Color.fromARGB(255, 240, 179, 88) : Colors.grey,
          ),
        ],
      ),
    );
  }
}
