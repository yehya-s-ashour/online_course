import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:online_course/core/Theme/styles/colors.dart';
import 'package:online_course/core/extensions/time_extension.dart';
import 'package:online_course/core/functions/navigator.dart';
import 'package:online_course/core/functions/time.dart';
import 'package:online_course/features/data/models/review_model.dart';
import 'package:online_course/features/presentation/components/custom_textfeild.dart';
import 'package:online_course/features/presentation/components/cutom_appbar.dart';
import 'package:online_course/features/presentation/components/my_cached_net_image.dart';
import 'package:online_course/features/presentation/controllers/chat_cubit/chat_cubit.dart';
import 'package:online_course/features/presentation/views/translate.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({Key? key}) : super(key: key);

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  double lenghtSlider = 225.0;
  List<Map<String, dynamic>> listSlider = [
    {
      "numOfStars": 5,
      "percen": 0.8,
    },
    {
      "numOfStars": 4,
      "percen": 0.5,
    },
    {
      "numOfStars": 3,
      "percen": 0.4,
    },
    {
      "numOfStars": 2,
      "percen": 0.3,
    },
    {
      "numOfStars": 1,
      "percen": 0.1,
    },
  ];

  int currentIndex = 0;
  double rating = 3.0;

  final TextEditingController _Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: userEntity.language == 'Arabic'
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: Scaffold(
        appBar: MyAppBar(
          title: userEntity.language != 'Arabic'
              ? Translation.Reviews1
              : Translation.Reviews2,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsDirectional.only(
              start: 10.w,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          4.toString(),
                          style: GoogleFonts.cairo(
                              fontSize: 45.spMin,
                              fontWeight: FontWeight.w800,
                              color: mixedColor),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ...List.generate(
                                4,
                                (index) => Icon(
                                      Icons.star,
                                      color: kPreviewsColors,
                                      size: 20.r,
                                    ))
                          ],
                        ),
                        Text(
                          '${3} reviews',
                          style: GoogleFonts.cairo(
                              color: Colors.black.withOpacity(0.4),
                              fontSize: 17.spMin),
                        ),
                        SizedBox(
                          height: 15.h,
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        ...listSlider
                            .map((e) => buildRowSilder(
                                numOfStars: e['numOfStars'],
                                percen: e['percen']))
                            .toList(),
                        SizedBox(
                          height: 8.h,
                        ),
                      ],
                    )
                  ],
                ),
                StreamBuilder<List<ReviewModel>>(
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: mixedColor,
                        ),
                      );
                    }
                    return Card(
                      color: Colors.white,
                      child: Container(
                          height: 485.h,
                          child: ListView.builder(
                              physics: BouncingScrollPhysics(),
                              itemBuilder: (context, index) =>
                                  buildColumn(context, snapshot.data![index]),
                              itemCount: snapshot.data!.length)),
                    );
                  },
                  stream: ChatCubit.get(context).getReview(),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: Align(
          alignment: AlignmentDirectional.bottomEnd,
          child: InkWell(
            onTap: () {
              showMaterialModalBottomSheet(
                context: context,
                builder: (context) => SingleChildScrollView(
                  controller: ModalScrollController.of(context),
                  child: StatefulBuilder(
                    builder: (BuildContext context, StateSetter func) {
                      double rating1 = 3.0;
                      return Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.w, vertical: 10.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.only(
                                  start: 12.w, top: 5.h),
                              child: Text(
                                userEntity.language != 'Arabic'
                                    ? Translation.Write_a_review1
                                    : Translation.Write_a_review2,
                                style: GoogleFonts.cairo(
                                    fontSize: 21.spMin,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ),
                            Center(
                              child: Container(
                                width: 270.w,
                                child: TextFieldWidget(
                                  controller: _Controller,
                                  hint: userEntity.language != 'Arabic'
                                      ? Translation.Write_a_review1
                                      : Translation.Write_a_review2,
                                  maxLine: 3,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            SizedBox(
                              width: 1.sw,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RatingBar.builder(
                                    initialRating: rating1,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemSize: 25.r,
                                    itemPadding: const EdgeInsets.symmetric(
                                        horizontal: 1.0),
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) {
                                      rating1 = rating;
                                      setState(
                                        () {
                                          func(
                                            () {},
                                          );
                                        },
                                      );
                                      func(
                                        () {},
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 6.h,
                            ),
                            Center(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    foregroundColor: kWhiteColor),
                                onPressed: () {
                                  ChatCubit.get(context).sendReview(
                                    _Controller.text,
                                    rating1.round(),
                                  );
                                  func(
                                    () {},
                                  );
                                  Get.back();
                                },
                                child: Text(
                                  userEntity.language != 'Arabic'
                                      ? Translation.Submit1
                                      : Translation.Submit2,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              );
            },
            child: Container(
              height: 38.h,
              width: 150.w,
              decoration: BoxDecoration(
                color: mixedColor,
                borderRadius: BorderRadius.all(Radius.circular(100)),
              ),
              child: Center(
                  child: Text(
                      userEntity.language != 'Arabic'
                          ? Translation.Write_a_review1
                          : Translation.Write_a_review2,
                      style: GoogleFonts.cairo(
                          fontSize: 21.spMin,
                          color: Colors.white,
                          fontWeight: FontWeight.w600))),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildColumn(BuildContext context, ReviewModel reviewModel) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 1.sw,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    MyCachedNetImage(imageUrl: reviewModel.image, radius: 28.h),
                    SizedBox(
                      width: 6.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(reviewModel.name,
                            style: GoogleFonts.cairo(
                              color: Colors.black,
                              fontSize: 20.spMin,
                              fontWeight: FontWeight.w600,
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ...List.generate(
                              reviewModel.review,
                              (index) => Icon(
                                Icons.star,
                                color: kPreviewsColors,
                                size: 14.r,
                              ),
                            ),
                            SizedBox(
                              width: 7.w,
                            ),
                            Text(
                              reviewModel.review.toString(),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.spMin,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(end: 10.w),
                  child: Text(
                    getTime(reviewModel.timeSend).chatContactTime,
                    style: GoogleFonts.cairo(
                      color: Colors.black.withOpacity(0.4),
                      fontSize: 17.spMin,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 30),
            child: Text(
              reviewModel.text,
              maxLines: 3,
              style: GoogleFonts.cairo(
                  color: Colors.grey[500],
                  fontSize: 16.spMin,
                  fontWeight: FontWeight.w500),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRowSilder({required int numOfStars, double percen = 0.8}) {
    return Row(
      children: [
        Row(
          children: [
            ...List.generate(
                numOfStars,
                (index) => Icon(
                      Icons.star,
                      color: kPreviewsColors,
                      size: 15.r,
                    ))
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 8.w),
          child: Container(
            height: 10.h,
            alignment: Alignment.centerLeft,
            width: 130.w,
            decoration: const BoxDecoration(
                color: kLightColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                )),
            child: Container(
              height: 9.h,
              width: lenghtSlider * percen,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                  color: mixedColor),
            ),
          ),
        ),
        Text(
          "20",
          style: GoogleFonts.cairo(
              fontSize: 15.spMin,
              color: Colors.black.withOpacity(0.4),
              fontWeight: FontWeight.w700),
        )
      ],
    );
  }
}
