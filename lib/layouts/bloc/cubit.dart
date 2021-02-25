import 'package:courses_app/layouts/bloc/states.dart';
import 'package:courses_app/modules/courses_categories/courses_categories.dart';
import 'package:courses_app/modules/dashboard/dashboard.dart';
import 'package:courses_app/modules/profile/profile.dart';
import 'package:courses_app/modules/search/search_courses.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates>{
  HomeCubit() : super(HomeStateInit());

  static HomeCubit get(context)=>BlocProvider.of(context);

  var currentIndex=0;

  List pages=[
    Dashboard(),
    SearchCourses()
,    CoursesCategories(),
   ProfileScreen(),
    Center(child: Text('settings'),),
  ];

  List title = [
    'Dashboard',
    'Search',
    'Courses',
    'Profile',
    'Settings'
  ];

  changeIndex(index){
    currentIndex=index;
    emit(HomeStateChangeIndex());
  }

}