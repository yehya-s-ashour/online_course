import 'package:flutter/material.dart';
import 'package:online_course/core/functions/navigator.dart';
import '/core/extensions/extensions.dart';

class FirstMessageSmallCurvedBubble extends StatelessWidget {
  final bool isMe;
  final bool isGroup;

  const FirstMessageSmallCurvedBubble({
    super.key,
    required this.isMe,
    required this.isGroup,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipPath(
          clipper: MyCustomClipper(isMe, isGroup),
          child: Container(
            width: 10,
            height: 15,
            decoration: BoxDecoration(
              color: isMe
                  ? context.colorScheme.surface
                  : (userEntity.theme == 'Light'
                      ? Colors.white
                      : Color(0xFF233138)),
            ),
          ),
        ),
      ],
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  final bool isMe;
  final bool isGroup;

  MyCustomClipper(this.isMe, this.isGroup);

  @override
  Path getClip(Size size) {
    Path path = Path();
    return isMe
        ? myCustomRightPath(path, size)
        : senderCustomLeftPath(path, size);
  }

  Path myCustomRightPath(Path path, Size size) {
    if (userEntity.language == 'Arabic') {
      double w = size.width;
      double h = size.height;
      path.lineTo(w - 2.5, 0);
      path.quadraticBezierTo(w, 2.5, w - 2.5, 5);
      path.lineTo(0, h);
      path.close();
      return path;
    } else {
      double w = size.width;
      double h = size.height;
      path.lineTo(2.5, 0);
      path.quadraticBezierTo(0, 2.5, 2.5, 5);
      path.lineTo(w, h);
      path.lineTo(w, 0);
      path.close();
      return path;
    }
  }

  Path senderCustomLeftPath(Path path, Size size) {
    if (userEntity.language == 'Arabic') {
      double w = size.width;
      double h = size.height;
      path.lineTo(w - 2.5, 0);
      path.quadraticBezierTo(w, 2.5, w - 2.5, 5);
      path.lineTo(0, h);
      path.close();
      return path;
    } else {
      double w = size.width;
      double h = size.height;
      path.lineTo(2.5, 0);
      path.quadraticBezierTo(0, 2.5, 2.5, 5);
      path.lineTo(w, h);
      path.lineTo(w, 0);
      path.close();
      return path;
    }
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
