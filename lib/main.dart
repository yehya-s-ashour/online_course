import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:online_course/features/presentation/controllers/Setting/SettingCubit.dart';
import 'package:online_course/features/presentation/controllers/chat_cubit/chat_cubit.dart';
import 'package:online_course/features/presentation/controllers/sing_in_cubit/LoginCubit.dart';
import 'package:online_course/features/presentation/controllers/sing_up_cubit/RegisterCubit.dart';

import 'core/Theme/theme.dart';
import 'features/presentation/controllers/bottom_chat_cubit/bottom_chat_cubit.dart';
import 'features/presentation/views/splash_screen.dart';

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
    return MultiBlocProvider(
      providers: [
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
      ],
      child: ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        designSize: const Size(360, 690),
        builder: (_, child) => GetMaterialApp(
          theme:AppTheme.light(context),
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
