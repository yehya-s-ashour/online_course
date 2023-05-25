import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:online_course/core/functions/navigator.dart';
import 'package:online_course/core/network/cache_helper.dart';
import 'package:online_course/core/shared/bloc_observer.dart';
import 'package:online_course/features/domain/entities/user.dart';
import 'package:online_course/features/presentation/controllers/LayoutCubit/LayoutCubit.dart';
import 'package:online_course/features/presentation/controllers/Setting/SettingCubit.dart';
import 'package:online_course/features/presentation/controllers/chat_cubit/chat_cubit.dart';
import 'package:online_course/features/presentation/controllers/sing_in_cubit/LoginCubit.dart';
import 'package:online_course/features/presentation/controllers/sing_up_cubit/RegisterCubit.dart';
import 'package:online_course/features/presentation/controllers/teacher_cubit/TeacherCubit.dart';

import 'core/Theme/theme.dart';
import 'features/presentation/controllers/bottom_chat_cubit/bottom_chat_cubit.dart';
import 'features/presentation/views/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  uid = CacheHelper.getData(key: 'uId');
  if (uid != null) {
    if (CacheHelper.getData(key: 'userEntity') != null) {
      List<String> user = CacheHelper.getData(key: 'userEntity').split(',');
      List<String> courseEnroll =
          CacheHelper.getDatas(key: 'courseEnroll') ?? [];
      userEntity = UserEntity(
        name: user[1],
        uId: user[0],
        bio: user[7],
        profilePic: user[6],
        email: user[3],
        password: user[2],
        token: user[8],
        language: user[4],
        theme: user[5],
        wallpaper: user[9],
        isTeacher: user[10]=='false'?false:true,
        courseEnroll: courseEnroll,
      );
    }
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => LayoutCubit()
              ..getUserData()
              ..getBusinessCourses()
              ..getDevelopmentCourses()
              ..getMarketingCourses()
              ..getPersonalDevelopmentCourses()
              ..getTeachingAcademicsCourses()
              ..getRoadmap()),
        BlocProvider(create: (context) => ChatCubit()),
        BlocProvider(create: (context) => BottomChatCubit()),
        BlocProvider(
          create: (context) => SettingCubit(),
        ),
        BlocProvider(
          create: (context) => RegisterCubit(),
        ),
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
       BlocProvider(
          create: (context) => TeacherCubit(),
        )
      ],
      child: ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        designSize: const Size(360, 690),
        builder: (_, child) => GetMaterialApp(
          theme: AppTheme.light(context),
          themeMode: ThemeMode.light,
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          home: child,
        ),
        child: const SplashScreen(),
      ),
    );
  }
}
