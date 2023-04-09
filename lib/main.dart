import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:online_course/features/presentation/views/noticctionsScreen/components/notificationsScreenAppBar.dart';
import 'package:online_course/features/presentation/views/splash_screen.dart';

import 'features/presentation/views/homeScreen/homeScreen.dart';
import 'features/presentation/views/noticctionsScreen/notificationsScreen.dart';
import 'features/presentation/views/serachScreen/SearchScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(360, 690),
      builder: (_, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: child,
      ),
      child: SplashScreen(),
    );
  }
}
