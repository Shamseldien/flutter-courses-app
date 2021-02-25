import 'dart:convert';

import 'package:courses_app/models/courses_model.dart';
import 'package:courses_app/modules/courses_categories/bloc/states.dart';
import 'package:courses_app/shared/components/components.dart';
import 'package:courses_app/shared/end_points.dart';
import 'package:courses_app/shared/network/remote/helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoursesCategoriesCubit extends Cubit<CoursesCategoriesStates>{
  CoursesCategoriesCubit():super(CoursesCategoriesInitState());

  static CoursesCategoriesCubit get(context)=>BlocProvider.of(context);

  CoursesModel model;
  List<Data>dataModel=[];
  int currentPage=2;
  int lastPage=0;
  getCourses(){
    emit(CoursesCategoriesLoadingState());
    DioHelper.getData(
     path: COURSES_END_POINT,
     token: getToken(),
     data: null,
    ).then((value){
      model = CoursesModel.fromJson(jsonDecode(value.toString()));
    dataModel=model.result.data;
      lastPage=model.result.lastPage;
      emit(CoursesCategoriesSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(CoursesCategoriesErrorState(error));
    });
  }

  getMoreCourses(){
    print(lastPage);
    emit(CoursesCategoriesMoreState());
    DioHelper.getData(
      path: COURSES_END_POINT,
      token: getToken(),
      data: null,
      query: {
        'page':currentPage
      },
    ).then((value){
      currentPage++;
      model = CoursesModel.fromJson(jsonDecode(value.toString()));
      dataModel.addAll(model.result.data);
      emit(CoursesCategoriesSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(CoursesCategoriesErrorState(error));
    });
  }



}