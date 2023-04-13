import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:online_course/core/Theme/styles/colors.dart';
import 'package:online_course/features/presentation/components/custom_textfeild.dart';
import 'package:online_course/features/presentation/components/cutom_appbar.dart';

class PrviewsScreen extends StatefulWidget {
  const PrviewsScreen({Key? key}) : super(key: key);

  @override
  State<PrviewsScreen> createState() => _PrviewsScreenState();
}

class _PrviewsScreenState extends State<PrviewsScreen> {
  double lenghtSlider = 225.0;
  List<Map<String, dynamic>> listSlider = [
    {
      "title": "Excellent",
      "percen": 0.8,
    },
    {
      "title": "Good",
      "percen": 0.5,
    },
    {
      "title": "Average",
      "percen": 0.4,
    },
    {
      "title": "Bellow Average",
      "percen": 0.3,
    },
    {
      "title": "poor",
      "percen": 0.1,
    },
  ];

  int currentIndex = 0;
  double rating = 3.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'Reviews',
      ),
      body: SizedBox(
        height: double.maxFinite,
        width: double.maxFinite,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buildPaddingToggle(context,
                  data: listSlider, preview: 4.8, numOfVoice: 58),
              // buildPaddingToggle(context,data:listSliderTwo ,preview: 3.2,numOfVoice:2 ),
            ],
          ),
        ),
      ),
    );
  }

  Padding buildPaddingToggle(BuildContext context,
      {required List data, required double preview, required int numOfVoice}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(preview.toString()),
          SizedBox(
            height: 7.h,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(
                  5,
                  (index) => Icon(
                        Icons.star,
                        color: kPreviewsColors,
                        size: 14.r,
                      ))
            ],
          ),
          SizedBox(
            height: 8.h,
          ),
          Text('Based on ${numOfVoice.toString()} reviews'),
          SizedBox(
            height: 10.h,
          ),
          ...data
              .map(
                  (e) => buildRowSilder(title: e['title'], percen: e['percen']))
              .toList(),
          SizedBox(
            height: 8.h,
          ),
          ...List.generate(2, (index) => buildColumn(context)),
          SizedBox(
            height: 10.h,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(1.sw / 1.2, 44.h),
                maximumSize: Size(1.sw / 1.2, 44.h),
              ),
              onPressed: () {
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
                              Text(
                                'write review ',
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                              TextFieldWidget(
                                hint: "write review ",
                                maxLine: 3,
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
                                          horizontal: 4.0),
                                      itemBuilder: (context, _) => const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: (rating) {
                                        rating1 = rating;
                                        setState(() {
                                          func(() {});
                                        });
                                        func(() {});
                                      },
                                    ),
                                    Text(rating1.toString()),
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
                                        func(() {});
                                        Get.back();
                                      },
                                      child: const Text('Review')))
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
              child: Text(
                'Write a Reviews',
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(color: kWhiteColor),
              ))
        ],
      ),
    );
  }

  Widget buildColumn(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Column(
        children: [
          SizedBox(
            width: 1.sw,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 22,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Column(
                      children: [
                        const Text('Kawsar Ahamed'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ...List.generate(
                                5,
                                (index) => Icon(
                                      Icons.star,
                                      color: kPreviewsColors,
                                      size: 13.r,
                                    )),
                            SizedBox(
                              width: 3.w,
                            ),
                            const Text('3.5'),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                Text(
                  '1 Day ago',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: kPrimaryFadeTextColor),
                )
              ],
            ),
          ),
          Text(
            ''' Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 
                    ''',
            maxLines: 3,
            style: Theme.of(context).textTheme.bodySmall,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget buildRowSilder({required String title, double percen = 0.8}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: Text(
            title,
            style: Theme.of(context).textTheme.bodySmall,
          )),
          Expanded(
            flex: 2,
            child: Container(
              height: 5.h,
              alignment: Alignment.centerLeft,
              width: lenghtSlider,
              decoration: const BoxDecoration(color: kLightColor),
              child: Container(
                height: 4.h,
                width: lenghtSlider * percen,
                decoration: const BoxDecoration(color: kPrimaryColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
