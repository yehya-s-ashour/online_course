
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../chat/components/image/show_image.dart';

class SelectImageFromGalleryButton extends StatelessWidget {
  final String receiverId;

  const SelectImageFromGalleryButton({
    super.key,
    required this.receiverId
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(Images(receiverId: receiverId, index: 1,));
      },
      child: const CircleAvatar(
        radius: 30,
        backgroundColor: Colors.black38,
        child: Icon(
          Icons.photo,
          size: 30,
        ),
      ),
    );
  }
}
