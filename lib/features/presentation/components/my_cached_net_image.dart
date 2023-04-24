import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:online_course/generated/assets.dart';





class MyCachedGroup extends StatelessWidget {
  final String imageUrl;
  final double radius;

  const MyCachedGroup({
    super.key,
    required this.imageUrl,
    required this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        width: radius * 2,
        height: radius * 2,
        placeholder: (context, url) => Stack(
          children: [
            Image.asset(Assets.assetsSplash1),
            const Align(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            )
          ],
        ),
        errorWidget: (context, url, error) =>
            Image.asset('assets/images/user3.png'),
        //height: 180.0,
        fit: BoxFit.cover,
      ),
    );
  }
}
