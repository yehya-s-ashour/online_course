import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_course/core/Theme/styles/colors.dart';

class CustomImage extends StatelessWidget {
  CustomImage(this.image,
      {this.width = 100,
      this.height = 100,
      this.bgColor,
      this.borderWidth = 0,
      this.borderColor,
      this.trBackground = false,
      this.fit = BoxFit.cover,
      this.isNetwork = true,
      this.radius = 50,
      this.borderRadius,
      this.isShadow = true});

  final String image;
  final double width;
  final double height;
  final double borderWidth;
  final bool isShadow;
  final Color? borderColor;
  final Color? bgColor;
  final bool trBackground;
  final bool isNetwork;
  final double radius;
  final BorderRadiusGeometry? borderRadius;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: borderRadius ?? BorderRadius.circular(radius),
          boxShadow: [
            if (isShadow)
              BoxShadow(
                color: shadowColor.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(0, 1), // changes position of shadow
              ),
          ],
        ),
        child: isNetwork
            ? CachedNetworkImage(
                imageUrl: image,
                placeholder: (context, url) => BlankImageWidget(),
                errorWidget: (context, url, error) => BlankImageWidget(),
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    borderRadius: borderRadius ?? BorderRadius.circular(radius),
                    image: DecorationImage(image: imageProvider, fit: fit),
                  ),
                ),
              )
            : Image(
                image: AssetImage(image),
                fit: fit,
              ));
  }
}

class CustomImageFile extends StatelessWidget {
  CustomImageFile(this.image,
      {this.width = 100,
      this.height = 100,
      this.bgColor,
      this.borderWidth = 0,
      this.borderColor,
      this.trBackground = false,
      this.fit = BoxFit.cover,
      this.radius = 50,
      this.borderRadius,
      this.isShadow = true});

  final String image;
  final double width;
  final double height;
  final double borderWidth;
  final bool isShadow;
  final Color? borderColor;
  final Color? bgColor;
  final bool trBackground;
  final double radius;
  final BorderRadiusGeometry? borderRadius;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: borderRadius ?? BorderRadius.circular(radius),
          boxShadow: [
            if (isShadow)
              BoxShadow(
                color: shadowColor.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(0, 1), // changes position of shadow
              ),
          ],
        ),
        child: image == ''
            ? Container(
                width: 90.w,
                height: 80.h,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2.spMin,
                      offset: Offset(0, 3),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(50.r),
                ),
                child: Icon(
                  Icons.add_a_photo_rounded,
                  color: Colors.black.withOpacity(0.9),
                  size: 65.spMax,
                ),
              )
            : Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(radius)),
                    image: DecorationImage(
                        image: FileImage(File(image)), fit: BoxFit.cover)),
                // child: Image(
                //     image: FileImage(File(image)),
                //     fit: fit,
                //   ),
              ));
  }
}

class BlankImageWidget extends StatefulWidget {
  const BlankImageWidget({Key? key}) : super(key: key);

  @override
  _BlankImageWidgetState createState() => _BlankImageWidgetState();
}

class _BlankImageWidgetState extends State<BlankImageWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Center(
          child: SizedBox(
        child: Card(
          margin: EdgeInsets.zero,
          clipBehavior: Clip.antiAlias,
          elevation: 0.0,
        ),
      )),
    );
  }
}
