import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:online_course/core/functions/navigator.dart';
import 'package:online_course/features/presentation/controllers/Setting/SettingCubit.dart';
import 'package:online_course/features/presentation/controllers/Setting/SettingState.dart';

import 'image_details.dart';

class Images extends StatefulWidget {
  final String? receiverId;
  final int index;

  const Images({Key? key, this.receiverId, required this.index})
      : super(key: key);

  @override
  State<Images> createState() => _ImagesState();
}

class _ImagesState extends State<Images>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  late final TabController _tabController;

  //late CachedVideoPlayerController videoPlayerController;
  bool isPlay = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    // _tabController.addListener(changeActions);
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   videoPlayerController.dispose();
  // }

  // void changeActions() {
  //   buildMainLayoutSliverAppBarActions(
  //     context,
  //     index: _tabController.index,
  //   );
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: userEntity.language == 'Arabic'
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: BlocConsumer<SettingCubit, SettingState>(
          builder: (context, state) {
            return Directionality(
              textDirection: TextDirection.ltr,
              child: Scaffold(
                appBar: AppBar(
                  title: Text(
                      userEntity.language == 'Arabic' ? "الاستديو" : 'Gallery'),
                ),
                body: Column(
                  children: [
                    Expanded(
                      child: GalleryWallpaper(),
                    ),
                  ],
                ),
              ),
            );
          },
          listener: (context, state) {}),
    );
  }

  Widget GalleryWallpaper() => Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SettingCubit.get(context).selectedModel.file == null
                ? Container()
                : Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10.h,
                        crossAxisSpacing: 10.w,
                      ),
                      itemBuilder: (_, i) {
                        var file = SettingCubit.get(context).files[i];
                        return GestureDetector(
                            onTap: () {
                              Get.to(ImageDetails(
                                receiverId: widget.receiverId,
                                title: file.folder,
                                file: file,
                                index: widget.index,
                              ));
                            },
                            child: widgetGallery(file.folder, file.file[0]));
                      },
                      itemCount: SettingCubit.get(context).files.length,
                    ),
                  ),
          ],
        ),
      );

  Widget widgetGallery(String name, String image) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 140.h,
            width: 160.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              image: DecorationImage(
                  image: FileImage(
                    File(
                      image,
                    ),
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 8.w, top: 5.h),
            child: Container(
              child: Text(
                '$name',
                style: TextStyle(fontSize: 16.sm),
                maxLines: 1,
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      );
}
