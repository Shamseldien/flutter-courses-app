import 'package:courses_app/layouts/bloc/cubit.dart';
import 'package:courses_app/layouts/home_layout.dart';
import 'package:courses_app/modules/authentication/login/bloc/cubit.dart';
import 'package:courses_app/modules/authentication/login/login_screen.dart';
import 'package:courses_app/modules/authentication/registration/bloc/cubit.dart';
import 'package:courses_app/modules/authentication/registration/registration_screen.dart';
import 'package:courses_app/modules/courses_categories/bloc/cubit.dart';
import 'package:courses_app/modules/profile/bloc/cubit.dart';
import 'package:courses_app/modules/splash/bloc/cubit.dart';
import 'package:courses_app/modules/splash/splash_scsreen.dart';
import 'package:courses_app/modules/welcome/bloc/cubit.dart';
import 'package:courses_app/modules/welcome/welcome.dart';
import 'package:courses_app/shared/components/components.dart';
import 'package:courses_app/shared/network/remote/helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

void main()async{
 WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initPref();
  DioHelper();
 Widget myWidget;
 if (getToken() == null) {
   myWidget = SplashScreen();
 } else {
   myWidget = HomeLayout();
 }
  runApp(MyApp(myWidget));
}

class MyApp extends StatelessWidget {
  Widget startWidget;
  MyApp(this.startWidget);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context)=>SplashCubit()),
          BlocProvider(create: (context)=>LoginCubit()),
          BlocProvider(create: (context)=>RegistrationCubit()),
          BlocProvider(create: (context)=>HomeCubit()),
          BlocProvider(create: (context)=>WelcomeCubit()),
          BlocProvider(create: (context)=>CoursesCategoriesCubit()),
          BlocProvider(create: (context)=>ProfileCubit()..getUserInfo()),
        ],
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: startWidget,
        ));
  }
}
