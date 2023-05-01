import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:online_course/features/data/models/file_model.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../../../../core/shared/commen.dart';

class ImageDetails extends StatelessWidget {
   ImageDetails(
      {Key? key,
      required this.title,
      required this.file,
      this.receiverId,
      required this.index})
      : super(key: key);

  final String title;
  final int index;
  final FileModel file;
  final String? receiverId;



  @override
  Widget build(BuildContext context) {
    String a = '';



    return Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 10.h,
                      crossAxisSpacing: 10.w,
                    ),
                    itemBuilder: (_, i) {

                      return GestureDetector(
                        onTap: () {
                          File compressImage = File(file.file[i]);

                          if (index == 1) {
                            // Navigator.of(context).pushNamed(
                            //   Routes.sendingImageViewRoute,
                            //   arguments: {
                            //     'path': file.file[i],
                            //     'uId': receiverId,
                            //     'isGroup': isGroup,
                            //   },
                            // );
                          } else if (index == 2) {
                            cropImage(file.file[i]).then((value) {
                              if (value != null) {
                                // AuthCubit.get(context)
                                //     .updateProfilePic(value.path);
                                // profilePhoto = value.path;
                              }
                              int count = 0;
                              Navigator.of(context)
                                  .popUntil((route) => count++ >= 3);
                            });
                          } else if (index == 3) {
                            // Get.to(ConfirmStatusScreen(
                            //     file: File(file.file[i])));
                          } else if (index == 4) {
                            cropImage(file.file[i]).then((value) {
                              if (value != null) {
                                // a = value.path;
                                // photoGroup = value.path;
                                // GroupCubit.get(context).savePath(a);
                              }
                            });
                            int count = 0;
                            Navigator.of(context)
                                .popUntil((route) => count++ >= 2);
                          }
                          else if (index == 5) {
                            cropImage(file.file[i]).then((value) {
                              if (value != null) {
                                // GroupCubit.get(context)
                                //     .updateGroupPic(value.path).then((value) {
                                // });

                              }
                              int count = 0;
                              Navigator.of(context)
                                  .popUntil((route) => count++ >= 3);
                            });
                          }
                        },
                        child: Image.file(
                          File(file.file[i]),
                          filterQuality: FilterQuality.low,
                          repeat: ImageRepeat.noRepeat,
                          cacheHeight: 980,
                          cacheWidth: 754,

                          /*snapshot.data!*/
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                    itemCount: file.file.length,
                  ),
                ),
              ),
            ],
          ),
        ));
  }

   @override
   initState()
   async{
     await Permission.storage.request();
   }
}
