import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../components/custom_image.dart';

class CourseDetailScreen extends StatelessWidget {
  const CourseDetailScreen({super.key,required this.name,required this.description, required this.image});
  final String name;
  final String description;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
            backgroundColor: Colors.white,
            elevation: 0,
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            actions: [
            ],
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
                child: Column(
                  children: [
                    CustomImage(
                      image,
                      isNetwork: true,
                      width: 1.sw,
                      fit: BoxFit.fill,
                      height: 200.h,
                      radius: 10.r,
                    ),
                     SizedBox(height: 12.h),
                    Text(
                      name,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                     SizedBox(height: 12.h),
                    Text(
                      "${description}",
                      style: GoogleFonts.tienne(fontSize: 14.spMin,fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
